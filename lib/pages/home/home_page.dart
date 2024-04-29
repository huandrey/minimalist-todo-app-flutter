
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mytodolist/db/todo_db.dart';
import 'package:mytodolist/pages/home/components/todo_tile.dart';
import 'package:mytodolist/utils/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  // reference to the box opened in main.dart
  final _box = Hive.box('todo_box');
  ToDoDb db = ToDoDb();

  // input controller
  final TextEditingController _controller = TextEditingController();
  
  @override
  void initState() {
    if (_box.get('todo_list') == null) {
      db.createInitData();
    } else {
      db.loadData();
    }

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 24),
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
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
      db.toDoList[index][1] = value!;
    });

    db.updateData();
  }

  void _saveNewTask() {
    Navigator.pop(context);
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });

    db.updateData();
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
