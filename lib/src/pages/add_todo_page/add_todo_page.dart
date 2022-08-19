import '../../central/widgets/my_btn.dart';
import '../../central/widgets/my_confetti_widget.dart';
import '../../central/widgets/my_text.dart';
import '../../central/widgets/my_textfield.dart';

import '../../central/widgets/my_loading_widget.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import '../../providers/add_todo_provider.dart';
import 'views/date_picker_deadline.dart';

class AddTodoPage extends StatefulWidget {
  final String appBarTitle;
  const AddTodoPage({Key? key, required this.appBarTitle}) : super(key: key);
  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddTodoProvider>(builder: (ctx, addTodoProvider, __) {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          Scaffold(
            backgroundColor: const Color(0xff46539E),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              title: myText(
                  txt: widget.appBarTitle,
                  color: const Color(0xffB9BFDB),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xff5899DA),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.short_text_sharp,
                        color: Color(0xff5899DA)))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                children: [
                  // NameTf(),
                  myTextField(addTodoProvider.tasktitleTeCtrl, "*Task title"),
                  myTextField(addTodoProvider.descriptionTeCtrl, "description"),

                  const SizedBox(height: 24),
                  const DatePickerDeadline(),

                  addTodoProvider.isUploading == true
                      ? const MyLoadingWidget()
                      : myBtn(
                          onPressed: () {
                            widget.appBarTitle == "Add new thing"
                                ? addTodoProvider.createTodo(context)
                                : addTodoProvider.updateTodo(context);
                          },
                          txtSize: 12,
                          btnColor: const Color(0XFF2EB9EF),
                          btnText: widget.appBarTitle == "Add new thing"
                              ? "ADD YOUR THING"
                              : "Update")
                ],
              ),
            ),
          ),
          const MyConfettiWidget()
        ],
      );
    });
  }
}
