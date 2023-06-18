import 'package:flutter/material.dart';

Widget? textfield(String hinttext, TextEditingController ctrl) {
  return TextFormField(
      controller: ctrl,
      decoration: InputDecoration(
          hintText: hinttext,
          border: OutlineInputBorder(borderSide: BorderSide())));
}
