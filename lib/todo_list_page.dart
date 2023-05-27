import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<String> _todoList = [];
  final List<String> _completedList = [];

  void _addToTodoList(String task) {
    setState(() {
      _todoList.add(task);
    });
  }

  void _markAsCompleted(int index) {
    setState(() {
      _completedList.add(_todoList[index]);
      _todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo List')),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: _todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_todoList[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () => _markAsCompleted(index),
                    ),
                  );
                })),
        Expanded(
            child: ListView.builder(
                itemCount: _completedList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_completedList[index]),
                    leading: const Icon(
                      Icons.done,
                      color: Colors.green,
                    ),
                  );
                })),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_showAddTaskDialog(context)},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    TextEditingController taskController = TextEditingController();

    void clearController() {
      taskController.dispose();
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a new task'),
            content: TextField(
              controller: taskController,
              decoration: const InputDecoration(hintText: 'Enter task name'),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    clearController();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    _addToTodoList(taskController.text);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'))
            ],
          );
        });
  }
}
