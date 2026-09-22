import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  const BasicAppButton({
    required this.onPressed,
    required this.title,
    this.textStyle,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, height ?? 80),
      ),
      child: Text(
        title,
        style:
            textStyle ??
            const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xffF6F6F6),
            ),
      ),
    );
  }
}
