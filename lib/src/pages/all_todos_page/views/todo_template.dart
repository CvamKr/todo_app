import 'dart:math';

import 'package:flutter/material.dart';
import '../../../central/widgets/my_cached_network_image.dart';
import '../../../central/widgets/my_sized_box.dart';
import '../../../central/widgets/my_text.dart';
import '../../../models/todo_model.dart';
import '../../../providers/user_provider.dart';
import 'edit_delete_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TodoTemplate extends StatelessWidget {
  final TodoModel todoModel;
  const TodoTemplate(this.todoModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => editDeleteBottomSheet(context, todoModel),
      child: Column(
        children: [
          myH(16),
          Row(
            children: <Widget>[
              MyCachedNetworkImage(
                imageUrl:
                    "https://i.pravatar.cc/150?img=${Random().nextInt(20)}",
                circleRadius: 26,
              ),
              myW(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: myText(
                              txt: todoModel.taskTitle,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(.65)),
                        ),
                        if (todoModel.deadline != null)
                          myText(
                              txt:
                                  DateFormat.MMMd().format(todoModel.deadline!),
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                      ],
                    ),
                    myH(3),
                    Row(
                      children: [
                        Expanded(
                          child: myText(
                              txt: todoModel.description,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.withOpacity(.9)),
                        ),
                        buildAssignedMemebersAvatar(context)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          myH(16),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.grey.withOpacity(.2),
          ),
        ],
      ),
    );
  }

  Widget buildAssignedMemebersAvatar(BuildContext context) {
    return Container(
      width: 60,
      height: 20,
      child: Stack(
          alignment: Alignment.centerRight,
          children: context
              .read<UserProvider>()
              .listDummyMembers
              .map<Widget>((e) => userAvatar(e))
              .toList()),
    );
  }

  Widget userAvatar(double? padding) {
    return Positioned(
      right: padding,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: MyCachedNetworkImage(
            circleRadius: 9,
            imageUrl: "https://i.pravatar.cc/150?img=${Random().nextInt(20)}",
          ),
        ),
      ),
    );
  }
}
