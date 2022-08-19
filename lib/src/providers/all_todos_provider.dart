import 'package:cloud_firestore/cloud_firestore.dart';
import '../central/services/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../models/todo_model.dart';
import 'user_provider.dart';

class AllTodosProvider with ChangeNotifier {
  List<TodoModel> todosList = [];

  Stream<QuerySnapshot> getTodos(BuildContext context) {
    String userId = context.read<UserProvider>().userModel.userId;
    return todosColRef
        .where("postedBy", isEqualTo: userId)
        .orderBy("createdOn", descending: true)
        .snapshots();
  }
}
