import 'package:flutter/material.dart';

const kCardNumberTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'U and I',
    fontWeight: FontWeight.bold,
    fontSize: 24);

    const kCardDefaultTextStyle = TextStyle(
    color: Colors.grey,
    fontFamily: 'U and I',
    fontSize: 25);

const kCVCTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'Satisfy',
    fontWeight: FontWeight.bold,
    fontSize: 20);

const kTextStyle = TextStyle(
  fontSize: 8,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontFamily: 'U and I',
);

const kNametextStyle = TextStyle(
  fontSize: 15,
  color: Colors.white,
  fontFamily: 'U and I',
);

const kDefaultNameTextStyle = TextStyle(
  fontSize: 15,
  color: Colors.grey,
  fontFamily: 'U and I',
);


const kValidtextStyle = TextStyle(
  fontSize: 15,
  color: Colors.white,
  fontFamily: 'U and I',
);

const kDefaultValidTextStyle = TextStyle(
  fontSize: 15,
  color: Colors.grey,
  fontFamily: 'U and I',
);

const kSignTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontFamily: 'Satisfy',
);

enum InputState { number, name, validate, CVV }

enum CardCompany {VISA, MASTER}

