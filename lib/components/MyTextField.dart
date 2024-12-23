import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  TextEditingController txtbox = TextEditingController();
  final String hintText;
  final bool obsecureText;
  final Color color;
  final double? padding;
  final IconData? icon;
  Mytextfield({
    super.key,
    required this.txtbox,
    required this.hintText,
    required this.obsecureText,
    required this.color,
    this.padding,
    this.icon,
  });
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 20),
      child: TextField(
        controller: txtbox,
        obscureText: obsecureText,
        decoration: InputDecoration(
          prefixIcon: icon != null ? Icon(icon, color: color) : null,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: 2),
          ),
          labelText: hintText,
          labelStyle: TextStyle(color: color),
        ),
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
