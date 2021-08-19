import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final IconData icon;
  final Color? primaryColor;
  final Color? accentColor;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType type;

  const CustomTextField({
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
      obscureText: this.obscureText,
      controller: this.controller,
      keyboardType: this.type,
      decoration: InputDecoration(
          prefixIcon: Icon(this.icon),
          hintText: this.placeholder,
          contentPadding: EdgeInsets.only(top: 14),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: this.primaryColor
                      ?? Theme.of(context).primaryColor,
                  width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: this.accentColor ??
                      Theme.of(context).accentColor,
                  width: 1.0))),
    );
  }
}
