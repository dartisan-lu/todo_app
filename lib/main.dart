import 'package:flutter/material.dart';
import 'package:todo_app/theme/app_theme.dart';
import 'package:todo_app/view/todo_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      theme: defaultTheme,
      home: const TodoScaffold(),
    );
  }
}
