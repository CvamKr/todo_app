import 'dart:developer';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../central/services/constants.dart';
import '../central/widgets/my_show_toast.dart';
import '../central/services/my_logger.dart';
import '../models/todo_model.dart';
import 'user_provider.dart';

class AddTodoProvider with ChangeNotifier {
  TodoModel todoModel = TodoModel();
  TextEditingController tasktitleTeCtrl = TextEditingController();
  TextEditingController descriptionTeCtrl = TextEditingController();
  final confettiController = ConfettiController();

  bool isUploading = false;

  Future createTodo(BuildContext context) async {
    logger.d("in createTodo");
    if (!validateData()) {
      return;
    }
    todoModel.createdOn = DateTime.now();
    feedTodoData(context);
    setLoading(true);
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      await todosColRef.add(todoModel.toJson());
      setLoading(false);

      myShowToast(
        msg: "Todo Created",
        bgColor: Colors.green,
      );
      resetData();
      showConfettiAnimation();
    } catch (e) {
      logger.e(e);
      setLoading(false);
      myShowToast(
        msg: "Something went wrong",
        bgColor: Colors.red,
      );
    }
  }

  feedTodoData(BuildContext context) {
    todoModel
      ..taskTitle = tasktitleTeCtrl.text
      ..description = descriptionTeCtrl.text
      ..postedBy = context.read<UserProvider>().userModel.userId;

    inspect(todoModel);
  }

  resetData() {
    todoModel = TodoModel(
      deadline: null,
    );
    tasktitleTeCtrl.text = "";
    descriptionTeCtrl.text = "";
  }

  bool validateData() {
    if (tasktitleTeCtrl.text == ""
        //  ||
        // todoModel.createdOn == null ||
        // descriptionTeCtrl.text == ""

        ) {
      logger.d("", "Task title is compusory");
      myShowToast(msg: "Task title is compusory", bgColor: Colors.red);
      return false;
    }

    return true;
  }

  feedInitialDataInUi(TodoModel todoModel) {
    logger.d("in feedInitialDataInUi()");
    this.todoModel = todoModel;
    tasktitleTeCtrl.text = todoModel.taskTitle;
    descriptionTeCtrl.text = todoModel.description;
    debugPrint("initialData: ${tasktitleTeCtrl.text}");
  }

  void deleteTodo(todoModel) {
    todosColRef.doc(todoModel.id).delete();
  }

  updateTodo(context) async {
    if (!validateData()) {
      return;
    }
    feedTodoData(context);

    setLoading(true);
    await todosColRef.doc(todoModel.id).update(todoModel.toJson());
    confettiController.play();

    setLoading(false);
    confettiController.stop();
    Navigator.pop(context);
  }

  setLoading(bool status) {
    isUploading = status;
    notifyListeners();
  }

  @override
  void dispose() {
    logger.d("in dispose: AddTodoProvider");
    tasktitleTeCtrl.dispose();
    descriptionTeCtrl.dispose();
    super.dispose();
  }

  void showConfettiAnimation() async {
    confettiController.play();
    await Future.delayed(const Duration(seconds: 1));
    confettiController.stop();
  }
}
