import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import '../../../central/widgets/my_btn.dart';
import '../../../providers/add_todo_provider.dart';
import '../../../models/todo_model.dart';
import 'package:provider/provider.dart';

import '../../../central/app_route/app_route.dart';
import '../../../central/app_route/route_args.dart';
import '../../../central/widgets/my_text.dart';

Future<dynamic> editDeleteBottomSheet(
    BuildContext context, TodoModel todoModel) {
  return showAdaptiveActionSheet(
    context: context,
    actions: <BottomSheetAction>[
      BottomSheetAction(
        title: const Text(
          "Edit",
          style: TextStyle(color: Colors.red),
        ),
        onPressed: (context) {
          Provider.of<AddTodoProvider>(context, listen: false)
              .feedInitialDataInUi(todoModel);
          Navigator.pop(context);
          Navigator.pushNamed(context, AppRoute.addTodoRoute,
              arguments: AddTodoArgs('Edit Todo'));
        },
      ),
      BottomSheetAction(
        title: const Text(
          "Delete",
          style: const TextStyle(color: Colors.red),
        ),
        onPressed: (context) async {
          // Navigator.pop(context);
          showDeleteDialog(context, todoModel);
        },
      ),
    ],
    cancelAction: CancelAction(title: const Text('Cancel')),
  );
}

showDeleteDialog(BuildContext context, TodoModel todoModel) {
  // set up the buttons
  Widget cancelButton = myBtn(
    btnText: "Cancel",
    btnColor: Colors.white,
    btnBorderColor: Colors.blue,
    btnTextColor: Colors.blue,
    onPressed: () {
      Navigator.pop(context);
      Navigator.pop(context);
    },
  );
  Widget deleteButton = myBtn(
    btnText: "Delete",
    padding: EdgeInsets.only(bottom: 8),
    btnColor: Colors.blue,
    // btnWidth: 200,
    onPressed: () {
      Provider.of<AddTodoProvider>(context, listen: false)
          .deleteTodo(todoModel);
      Navigator.pop(context);
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: myText(
        txt: "Do you really want to delete?", textAlign: TextAlign.center),
    actions: [
      deleteButton,
      cancelButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
