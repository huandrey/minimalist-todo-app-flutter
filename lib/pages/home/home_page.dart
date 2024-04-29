
import 'package:flutter/material.dart';
import 'package:mytodolist/pages/home/components/todo_tile.dart';
import 'package:mytodolist/utils/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  List todoList = [
    ['Task 1', false],
    ['Task 2', true],
    ['Task 3', false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 24),
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) {
              _checkboxOnChange(value, index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _checkboxOnChange(bool? value, int index) {
    setState(() {
      todoList[index][1] = value!;
    });
  }

  void _saveNewTask() {
    Navigator.pop(context);
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void _addTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSuccess: _saveNewTask,
          onCancel: () {
            Navigator.pop(context);
          },
        );
      }
    );
  }
}
