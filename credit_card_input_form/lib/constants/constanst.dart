import 'package:flutter/material.dart';

final kCardNumberTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'U and I',
    fontWeight: FontWeight.bold,
    package: 'credit_card_input_form',
    letterSpacing: 1.5,
    fontSize: 25);

final kCardDefaultTextStyle = TextStyle(
  color: Colors.grey,
  fontFamily: 'U and I',
  package: 'credit_card_input_form',
  fontSize: 25,
  letterSpacing: 1,
);

final kCVCTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'Satisfy',
    fontWeight: FontWeight.bold,
    package: 'credit_card_input_form',
    fontSize: 20);

final kTextStyle = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'U and I',
    package: 'credit_card_input_form');

const kNametextStyle = TextStyle(
    fontSize: 15,
    color: Colors.white,
    fontFamily: 'U and I',
    package: 'credit_card_input_form');

const kDefaultNameTextStyle = TextStyle(
    fontSize: 15,
    color: Colors.grey,
    fontFamily: 'U and I',
    package: 'credit_card_input_form');

const kValidtextStyle = TextStyle(
  fontSize: 15,
  letterSpacing: 2,
  color: Colors.white,
  package: 'credit_card_input_form',
  fontFamily: 'U and I',
);

const kDefaultValidTextStyle = TextStyle(
    fontSize: 15,
    color: Colors.grey,
    fontFamily: 'U and I',
    package: 'credit_card_input_form');

const kSignTextStyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontFamily: 'Satisfy',
    package: 'credit_card_input_form');

enum InputState { NUMBER, NAME, VALIDATE, CVV, DONE }

enum CardCompany { VISA, MASTER, AMERICAN_EXPRESS, DISCOVER, OTHER }
