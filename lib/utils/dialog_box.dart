import 'package:flutter/material.dart';
import 'package:mytodolist/shared/default_button.dart';

class DialogBox extends StatelessWidget {
  
  final TextEditingController controller;
  VoidCallback onSuccess;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSuccess,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade700,
      content: Container(
        padding: const EdgeInsets.all(16),
        height: 160,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Adicione sua atividade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DefaultButton(
                  onPressed: onCancel,
                  label: "Cancelar"
                ),
                const SizedBox(width: 16,),
                DefaultButton(
                  label: "Adicionar",
                  onPressed: onSuccess,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}