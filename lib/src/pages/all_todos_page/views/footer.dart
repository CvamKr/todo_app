import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../../../central/widgets/my_sized_box.dart';
import '../../../central/widgets/my_text.dart';

Widget footer() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(24.0, 0, 24, 24),
    child: Row(
      children: <Widget>[
        myText(
            txt: "COMPLETED", fontWeight: FontWeight.bold, color: Colors.grey),
        myW(8),
        Badge(
          toAnimate: false,
          shape: BadgeShape.circle,
          badgeColor: Colors.grey,
          borderRadius: BorderRadius.circular(8),
          badgeContent: const Text('5', style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}
