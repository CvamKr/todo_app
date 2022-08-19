import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import '../../../providers/all_todos_provider.dart';
import 'todo_template.dart';
import 'package:provider/provider.dart';
import '../../../central/services/my_logger.dart';
import '../../../models/todo_model.dart';
import 'package:flutter/material.dart';

class AllTodosList extends StatelessWidget {
  const AllTodosList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<AllTodosProvider>(
      builder: (ctx, allTodosProvider, _) => StreamBuilder<QuerySnapshot>(
        stream: allTodosProvider.getTodos(context),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: Text('Something went wrong')),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: Text("Loading...")),
            );
          }
          allTodosProvider.todosList =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            return TodoModel.fromJson(
                document.data() as Map<String, dynamic>, document);
          }).toList();
          logger.d("todosList", allTodosProvider.todosList.length.toString());

          return allTodosProvider.todosList.isEmpty
              ? Center(
                  child: Lottie.network(
                      "https://assets4.lottiefiles.com/private_files/lf30_e3pteeho.json",
                      height: 250))
              : buildTodoList(snapshot, allTodosProvider);
        },
      ),
    );
  }

  Widget buildTodoList(snapshot, AllTodosProvider todoProvider) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
      itemCount: snapshot.data!.docs.length,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        TodoModel todoModel = todoProvider.todosList[index];
        return TodoTemplate(todoModel);
      },
    );
  }
}
