import 'package:flutter/material.dart';

final kCardNumberTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'U and I',
  fontWeight: FontWeight.bold,
  package: 'credit_card_input_form',
  letterSpacing: 1.5,
  fontSize: 25,
);

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
  fontSize: 20,
);

final kTextStyle = TextStyle(
  fontSize: 8,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontFamily: 'U and I',
  package: 'credit_card_input_form',
);

const kNametextStyle = TextStyle(
  fontSize: 15,
  color: Colors.white,
  fontFamily: 'U and I',
  package: 'credit_card_input_form',
);

const kDefaultNameTextStyle = TextStyle(
  fontSize: 15,
  color: Colors.grey,
  fontFamily: 'U and I',
  package: 'credit_card_input_form',
);

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
  package: 'credit_card_input_form',
);

const kSignTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontFamily: 'Satisfy',
  package: 'credit_card_input_form',
);

const kDefaultButtonTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15);

const defaultNextPrevButtonDecoration = BoxDecoration(
  boxShadow: <BoxShadow>[
    BoxShadow(color: Colors.black54, blurRadius: 5.0, offset: Offset(0, 5))
  ],
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30)),
  gradient: LinearGradient(
      colors: [
        const Color(0xff6c16c7),
        const Color(0xFFB16B92),
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);

const defaultResetButtonDecoration = BoxDecoration(
  boxShadow: <BoxShadow>[
    BoxShadow(color: Colors.black54, blurRadius: 5.0, offset: Offset(0, 5))
  ],
  borderRadius: BorderRadius.all(Radius.circular(30)),
  gradient: LinearGradient(
      colors: [
        const Color(0xff6c16c7),
        const Color(0xFFB16B92),
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);

const defaultCardDecoration = BoxDecoration(
    boxShadow: <BoxShadow>[
      BoxShadow(color: Colors.black54, blurRadius: 15.0, offset: Offset(0, 8))
    ],
    color: Color(0xFF5D5D5E),
    borderRadius: BorderRadius.all(Radius.circular(15)));

enum InputState { NUMBER, NAME, VALIDATE, CVV, DONE }

enum CardCompany { VISA, MASTER, AMERICAN_EXPRESS, DISCOVER, OTHER }
