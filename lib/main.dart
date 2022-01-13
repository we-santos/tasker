import 'package:flutter/material.dart';
import 'package:tasker/screens/task/lista.dart';

void main() => runApp(TaskerApp());

class TaskerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ListaTask(),
    );
  }
}
