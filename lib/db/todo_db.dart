import 'package:hive_flutter/hive_flutter.dart';

class ToDoDb {
  List toDoList = [];

  // reference to the box opened in main.dart
  final _box = Hive.box('todo_box');

  // run this method always if this is the 1st time the app is opened
  void createInitData() {
    toDoList = [
      [
        "Seja bem vindo",
        false,
      ],
      [
        "Crie uma nova tarefa",
        false,
      ],
      [
        "Clique no botão de adicionar",
        false,
      ],
      [
        "Clique na tarefa para marcar como concluída",
        false,
      ],
      [
        "Deslize a tarefa para a direita para excluir",
        false,
      ],
    ];
  }

  // load data from the box
  void loadData() {
    toDoList = _box.get('todo_list');
  }

  void updateData() {
    _box.put('todo_list', toDoList);
  }
}
