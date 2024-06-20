// styles/styles_user_profile.dart

import 'package:flutter/material.dart';

// Define text styles
const TextStyle kTextStyleWhite14 = TextStyle(
  color: Colors.white,
  fontSize: 14,
);

const TextStyle kTextStyleBold = TextStyle(
  color: Color.fromARGB(255, 0, 0, 30),
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

// Define decorations
const InputDecoration kInputDecoration = InputDecoration(
  labelStyle: TextStyle(
    color: Colors.white,
    fontSize: 14,
  ),
);

const BoxDecoration kBoxDecoration = BoxDecoration(
  gradient: RadialGradient(
    center: Alignment.centerRight,
    radius: 0.8,
    colors: [
      Color.fromARGB(255, 140, 180, 240),
      Color.fromARGB(255, 140, 170, 225),
      Color.fromARGB(255, 140, 155, 220),
    ],
  ),
  boxShadow: [
    BoxShadow(
      color: Color.fromARGB(255, 133, 133, 133),
      spreadRadius: 1,
      blurRadius: 2,
      offset: Offset(0, 3),
    ),
  ],
  borderRadius: BorderRadius.all(Radius.circular(60)),
);
