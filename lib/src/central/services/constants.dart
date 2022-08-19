// //routesNames
// const String allTodosRoute = '/AllTodosPage';
// const String loginPageRoute = '/LoginPage';
// const String addTodoRoute = '/AddTodoPage';

import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference todosColRef =
    FirebaseFirestore.instance.collection('todos');
