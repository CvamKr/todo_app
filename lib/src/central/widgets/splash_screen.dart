import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../pages/all_todos_page/all_todos_page.dart';
import '../../providers/user_provider.dart';
import '../authentication/authentication_provider.dart';
import 'my_loading_widget.dart';
import '../../models/user_model.dart';
import '../../pages/login_page/login_page.dart';
import 'package:provider/provider.dart';

import '../services/my_logger.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MyLoadingWidget();
          }
          User? firebaseUser = snapshot.data;
          logger.d("user: $firebaseUser");
          if (firebaseUser == null) {
            context.read<UserProvider>().feedDataToUserModel(null);
            return LoginPage();
          } else {
            context.read<UserProvider>().feedDataToUserModel(firebaseUser);
            return const AllTodosPage();
          }
        });
  }
}
