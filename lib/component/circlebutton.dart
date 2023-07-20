import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Color backgroundColor;
  final String label;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const CircleButton({
    required this.backgroundColor,
    required this.label,
    required this.textStyle,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: 25,
        child: Text(
          label,
          style: textStyle,
        ),
      ),
    );
  }
}