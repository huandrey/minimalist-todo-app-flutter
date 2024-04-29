import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String label;
  VoidCallback onPressed;

  DefaultButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.yellow.shade700,
      child: Text(label),
    );
  }
}