import 'package:flutter/material.dart';

const kNumberFont = TextStyle(
    color: Colors.white,
    fontFamily: 'U and I',
    fontWeight: FontWeight.bold,
    fontSize: 25);

const kTextStyle = TextStyle(
  fontSize: 8,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontFamily: 'U and I',
);

const kInputTextStyle = TextStyle(
  fontSize: 15,
  color: Colors.white,
  fontFamily: 'U and I',
);

enum InputState {
  number,
  name,
  validate,
  CVS
}