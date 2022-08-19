import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/add_todo_provider.dart';

class MyConfettiWidget extends StatelessWidget {
  const MyConfettiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addTodoProvider =
        Provider.of<AddTodoProvider>(context, listen: false);
    return ConfettiWidget(
      confettiController: addTodoProvider.confettiController,
      shouldLoop: true,
      blastDirectionality: BlastDirectionality.explosive,
      //blastDirection: pi,
      emissionFrequency: 0.2,
      numberOfParticles: 10,
      maxBlastForce: 10,
      gravity: 0.8,
      colors: [
        Colors.green,
        Colors.black,
        Colors.red,
      ],
      createParticlePath: (size) {
        double degToRad(double deg) => deg * (pi / 180.0);

        const numberOfPoints = 5;
        final halfWidth = size.width / 2;
        final externalRadius = halfWidth;
        final internalRadius = halfWidth / 2.5;
        final degreesPerStep = degToRad(360 / numberOfPoints);
        final halfDegreesPerStep = degreesPerStep / 2;
        final path = Path();
        final fullAngle = degToRad(360);
        path.moveTo(size.width, halfWidth);

        for (double step = 0; step < fullAngle; step += degreesPerStep) {
          path.lineTo(halfWidth + externalRadius * cos(step),
              halfWidth + externalRadius * sin(step));
          path.lineTo(
              halfWidth + internalRadius * cos(step + halfDegreesPerStep),
              halfWidth + internalRadius * sin(step + halfDegreesPerStep));
        }
        path.close();
        return path;
      },
    );
  }
}
