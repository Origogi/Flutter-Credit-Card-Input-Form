import 'package:flutter/material.dart';

import '../credit_card_input_form.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        CreditCardInputForm(
          onStateChange: (currentState, cardInfo) {
            print(currentState);
            print(cardInfo);
          },
        ),
      ])),
    );
  }
}
