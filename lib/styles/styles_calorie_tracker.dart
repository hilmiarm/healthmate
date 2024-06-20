import 'package:flutter/material.dart';

const TextStyle titleTextStyle = TextStyle(
  color: Color.fromARGB(255, 140, 170, 225),
  fontSize: 24,
  fontWeight: FontWeight.normal,
);

const TextStyle labelTextStyle = TextStyle(
  color: Color.fromARGB(255, 50, 50, 50),
  fontSize: 14,
);

const TextStyle inputTextStyle = TextStyle(
  color: Color.fromARGB(255, 50, 50, 50),
  fontSize: 14,
);

const BoxDecoration containerDecoration = BoxDecoration(
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
      color: Color.fromARGB(255, 230, 230, 230),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(0, 5),
    ),
  ],
  borderRadius: BorderRadius.all(Radius.circular(60)),
);
