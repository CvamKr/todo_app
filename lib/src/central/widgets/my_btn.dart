import 'package:flutter/material.dart';

Widget myBtn({
  double btnWidth = double.infinity,
  double btnHeight = 44,
  Color btnBorderColor = Colors.transparent,
  Color btnColor = const Color(0xff00C3D2),
  String btnText = "Next",
  Color btnTextColor = Colors.white,
  double txtSize = 16,
  EdgeInsetsGeometry padding = const EdgeInsets.all(0.0),
  required Function()? onPressed,
  OutlinedBorder? shape,
  FontWeight btnTextWeight = FontWeight.w400,
  // OutlinedBorder shape = const RoundedRectangleBorder(
  //   side: BorderSide(

  //         // width: 1,
  //         color: onPressed == null ? Colors.grey[300]! : btnBorderColor,
  //         // style: BorderStyle.solid,
  //       ),
  //   borderRadius:  const BorderRadius.circular(30.0))
}) {
  return Padding(
    padding: padding,
    child: SizedBox(
      width: btnWidth,
      height: btnHeight,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: onPressed == null ? Colors.grey[300]! : btnColor,
          shape:
              //
              shape,
          // RoundedRectangleBorder(
          //     // side: BorderSide(
          //     //   // width: 1,
          //     //   color:
          //     //       onPressed == null ? Colors.grey[300]! : btnBorderColor,
          //     //   // style: BorderStyle.solid,
          //     // ),
          //     borderRadius: BorderRadius.circular(30.0)),
          side: BorderSide(
            // width: 1,
            color: onPressed == null ? Colors.grey[300]! : btnBorderColor,
            // style: BorderStyle.solid,
          ),
        ),
        onPressed: onPressed,
        child: Text(btnText,
            style: TextStyle(
                color: btnTextColor,
                fontSize: txtSize,
                fontWeight: btnTextWeight)),
      ),
    ),
  );
}