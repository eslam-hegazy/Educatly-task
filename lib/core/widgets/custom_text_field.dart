import 'package:flutter/material.dart';

Widget customTextField({
  required TextEditingController controller,
  required String hintText,
  bool obsecure = false,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      obscureText: obsecure,
      validator: (value) {
        if (value!.isEmpty) {
          return "this Field is Required";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}
