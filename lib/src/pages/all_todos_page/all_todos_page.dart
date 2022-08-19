import '../../central/app_route/app_route.dart';

import '../../central/app_route/route_args.dart';
import '../../central/widgets/my_text.dart';
import '../../providers/add_todo_provider.dart';
import 'views/task_info.dart';
import 'package:provider/provider.dart';
import '../../models/todo_model.dart';
import 'views/all_todos_list.dart';

import 'package:flutter/material.dart';

import 'views/footer.dart';

class AllTodosPage extends StatelessWidget {
  static const String name = '/AllTodosPage';
  const AllTodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TaskInfo(),
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 20, 0, 4),
            child: myText(
                txt: "INBOX",
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
          const Expanded(child: AllTodosList()),
          footer(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<AddTodoProvider>(context, listen: false)
              .feedInitialDataInUi(TodoModel());

          Navigator.pushNamed(context, AppRoute.addTodoRoute,
              arguments: AddTodoArgs('Add new thing'));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
