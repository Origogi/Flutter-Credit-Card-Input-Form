import 'package:flutter/material.dart';

import 'package:credit_card_input_form/credit_card_input_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // translate and customize captions
  final Map<String, String> customCaptions = {
    'PREV': 'Prev',
    'NEXT': 'Next',
    'DONE': 'Done',
    'CARD_NUMBER': 'Card Number',
    'CARDHOLDER_NAME': 'Cardholder Name',
    'VALID_THRU': 'Valid Thru',
    'SECURITY_CODE_CVC': 'Security Code (CVC)',
    'NAME_SURNAME': 'Name Surname',
    'MM_YY': 'MM/YY',
    'RESET': 'Reset',
  };

  final buttonStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    gradient: LinearGradient(
        colors: [
          const Color(0xfffcdf8a),
          const Color(0xfff38381),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );

  final buttonTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            child: Stack(children: [
              CreditCardInputForm(
                showResetButton: true,
                onStateChange: (currentState, cardInfo) {
                  print(currentState);
                  print(cardInfo);
                },
                customCaptions: customCaptions,
                // prevButtonStyle: buttonStyle,
                // nextButtonStyle: buttonStyle,
                // prevButtonTextStyle: buttonTextStyle,
                // nextButtonTextStyle: buttonTextStyle,
                // resetButtonTextStyle: buttonTextStyle,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
