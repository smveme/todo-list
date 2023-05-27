import 'package:flutter/material.dart';
import 'package:todo_list/todo_list_page.dart';

void main(){
  runApp(const TodoList());
}

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue), useMaterial3: true),
      home:  const TodoListPage()
    );
  }
}