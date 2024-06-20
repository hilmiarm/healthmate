// lib/styles/styles_articles.dart

import 'package:flutter/material.dart';

const pageTitleStyle = TextStyle(
  fontSize: 24,
  color: Color.fromARGB(255, 50, 50, 50),
  fontWeight: FontWeight.bold,
);

const articleCountStyle = TextStyle(
  fontSize: 14,
  color: Color.fromRGBO(50, 50, 50, 1),
);

const articleTitleStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(255, 50, 50, 50),
);

const articleDateStyle = TextStyle(
  fontSize: 12,
  color: Colors.grey,
);

const articleCardDecoration = BoxDecoration(
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
      color: Color.fromARGB(255, 255, 255, 255),
      spreadRadius: 1,
      blurRadius: 1,
      offset: Offset(0, 2),
    ),
  ],
  borderRadius: BorderRadius.all(Radius.circular(30)),
);

final articleButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Color.fromARGB(255, 255, 255, 255),
  foregroundColor: Color.fromARGB(255, 140, 155, 220),
  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
);

final buttonBoxShadow = BoxShadow(
  color: Colors.black.withOpacity(0.1),
  spreadRadius: 2,
  blurRadius: 4,
  offset: Offset(0, 5),
);
