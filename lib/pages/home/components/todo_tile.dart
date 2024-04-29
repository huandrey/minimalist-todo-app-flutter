import 'package:flutter/material.dart';
import 'package:mytodolist/utils/extensions.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  const TodoTile({
    super.key, 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted, 
              onChanged: onChanged,
                checkColor: const Color.fromRGBO(253, 216, 53, 1),
            ),
            Text(
                taskName.truncateTo(36), 
              style: TextStyle(
                color: Colors.grey.shade200,
                decoration: taskCompleted ? TextDecoration.lineThrough : null,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        )
      ),
    );
  }
}