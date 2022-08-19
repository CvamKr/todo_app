import 'package:flutter/material.dart';

Widget myIconBtn({
  required IconData icon,
  double iconSize = 24,
  Alignment alignment = Alignment.centerRight,
  required Function() onPressed,
}) {
  return Container(
    // color: Colors.grey,
    padding: const EdgeInsets.all(0.0),
    width: 40.0,
    height: 50,
    child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: Align(
            alignment: alignment,
            child: Icon(
              icon,
              size: iconSize,
              color: Colors.white,
            )),
        onPressed: onPressed),
  );
}
