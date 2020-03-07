
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/provider/card_number_provider.dart';
import 'package:provider/provider.dart';

class CardLogo extends StatelessWidget {
  final master = Image.asset(
    'images/mastercard.png',
    width: 50,
  );
  final visa = Image.asset(
    'images/visacard.png',
    width: 50,
  );
  @override
  Widget build(BuildContext context) {
    String cardNumber = Provider.of<CardNumberProvider>(context).cardNumber;

    bool visaSelected = false;
    bool masterSelected = false;

    if (cardNumber.isEmpty) {
      visaSelected = false;
      masterSelected = false;
    } else if (cardNumber.startsWith('3')) {
      visaSelected = true;
      masterSelected = false;
    } else {
      visaSelected = false;
      masterSelected = true;
    }

    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          opacity: visaSelected ? 1 : 0,
          child: visa,
          duration: Duration(milliseconds: 200),
        ),
        AnimatedOpacity(
            opacity: masterSelected ? 1 : 0,
            child: master,
            duration: Duration(milliseconds: 200)),
      ],
    );
  }
}
