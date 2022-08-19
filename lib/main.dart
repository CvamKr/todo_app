import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'src/central/authentication/authentication_provider.dart';

import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/providers/add_todo_provider.dart';
import 'src/providers/all_todos_provider.dart';
import 'src/providers/user_provider.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (ctx) => AllTodosProvider()),
    ChangeNotifierProvider(create: (ctx) => AddTodoProvider()),
    ChangeNotifierProvider(create: (ctx) => UserProvider()),
    ChangeNotifierProvider(create: (ctx) => AuthenticationProvider()),
  ], child: MyApp(settingsController: settingsController)));
}
