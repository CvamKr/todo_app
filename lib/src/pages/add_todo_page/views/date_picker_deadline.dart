import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../central/widgets/my_text.dart';
import '../../../providers/add_todo_provider.dart';

class DatePickerDeadline extends StatefulWidget {
  const DatePickerDeadline({Key? key}) : super(key: key);

  @override
  State<DatePickerDeadline> createState() => _DatePickerDeadlineState();
}

class _DatePickerDeadlineState extends State<DatePickerDeadline> {
  @override
  Widget build(BuildContext context) {
    final addTodoProvider = Provider.of<AddTodoProvider>(context);

    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
        child: myText(
            txt: addTodoProvider.todoModel.deadline != null
                ? addTodoProvider.todoModel.deadline.toString().split(" ")[0]
                : "Pick Date",
            color: addTodoProvider.todoModel.deadline == null
                ? Colors.grey.withOpacity(.7)
                : Colors.white),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: context.read<AddTodoProvider>().todoModel.deadline ??
            DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        Provider.of<AddTodoProvider>(context, listen: false)
            .todoModel
            .deadline = picked;
        // selectedDate = picked;
      });
    }
  }
}
