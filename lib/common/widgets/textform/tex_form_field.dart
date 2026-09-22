import 'package:flutter/material.dart';

class TexFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final double? height;

  const TexFormField({
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: height ?? 80,
      width: 334,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: isDark ? Colors.white24 : Colors.black12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
