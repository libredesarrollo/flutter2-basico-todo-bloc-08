import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final IconData icon;
  final Color? primaryColor;
  final Color? accentColor;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType type;

  const CustomTextField({super.key, 
    required this.placeholder,
    required this.icon,
    required this.controller,
    this.primaryColor,
    this.accentColor,
    this.obscureText = false,
    this.type = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: placeholder,
          contentPadding: const EdgeInsets.only(top: 14),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: primaryColor
                      ?? Theme.of(context).primaryColor,
                  width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: accentColor ??
                      Theme.of(context).colorScheme.secondary,
                  width: 1.0))),
    );
  }
}
