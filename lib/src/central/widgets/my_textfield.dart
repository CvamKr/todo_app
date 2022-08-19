import 'package:flutter/material.dart';

Widget myTextField(TextEditingController controller, String hintText) {
  return TextField(
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
        // border: UnderlineInputBorder(
        //     borderSide: BorderSide(color: Colors.white))
        enabledBorder: const UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(.5))),
    controller: controller,
  );
}
