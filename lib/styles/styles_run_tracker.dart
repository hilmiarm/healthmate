import 'package:flutter/material.dart';

final runTrackerBoxDecoration = BoxDecoration(
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

final runTrackerButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Color.fromARGB(255, 255, 255, 255),
  foregroundColor: Color.fromARGB(255, 0, 0, 0),
  padding: EdgeInsets.symmetric(vertical: 20.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(60.0),
  ),
);

final buttonBoxShadow = BoxShadow(
  color: Colors.black.withOpacity(0.1),
  spreadRadius: 2,
  blurRadius: 4,
  offset: Offset(0, 5),
);
