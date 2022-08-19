import 'package:flutter/cupertino.dart';

Widget myH(double? height) {
  return SizedBox(
    height: height ?? 8,
  );
}

myW(double? width) {
  return SizedBox(
    width: width ?? 8,
  );
}
