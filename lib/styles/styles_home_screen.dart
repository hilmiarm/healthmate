import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 50, 50, 50),
  );

  static const TextStyle weatherText = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 140, 155, 220),
  );

  static const TextStyle labelText_luar = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Color.fromARGB(255, 140, 155, 220),
  );

    static const TextStyle labelText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Color.fromARGB(255, 50, 50, 50),
  );

  static const TextStyle hintText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Color.fromARGB(255, 50, 50, 50),
  );

  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    shape: CircleBorder(),
    padding: EdgeInsets.all(28),
    shadowColor: Colors.black,
    elevation: 5,
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
  );

  static final BoxDecoration weatherBoxDecoration = BoxDecoration(
    gradient: RadialGradient(
      center: Alignment.centerRight,
      radius: 0.8,
      colors: [
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 255, 255, 255),
      ],
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 2,
        offset: Offset(0, 5),
      ),
    ],
    borderRadius: BorderRadius.circular(60),
  );
}
