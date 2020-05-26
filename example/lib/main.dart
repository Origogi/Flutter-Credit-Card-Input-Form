import 'dart:math';

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
  @override
  void initState() {
    super.initState();
  }

  var currentColor = Colors.amber;
  final colors = [Colors.amber, Colors.blue, Colors.red, Colors.pink];
  final ramdom = Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
          child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        // color: currentColor,
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              curve: Curves.easeInOutBack,
              duration: Duration(milliseconds: 300),
              width: 100.0 + ramdom.nextInt(300),
              height: 100.0 + ramdom.nextInt(300),
              color: currentColor,
            ),
            Stack(children: [
              CreditCardInputForm(
                onStateChange: (currentState, cardInfo) {
                  setState(() {
                    currentColor = colors[ramdom.nextInt(colors.length)];
                  });
                  print(currentState);
                  print(cardInfo);
                },
              ),
            ]),
          ],
        ),
      )),
    ));
  }
}
