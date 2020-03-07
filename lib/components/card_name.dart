import 'package:flutter/material.dart';
import 'package:flutter_credit_card/constanst.dart';

class CardName extends StatelessWidget {

  String defaultName = 'NAME SURNAME';

  @override
  Widget build(BuildContext context) {
    return Text(
      'NAME SURNAME',
      style: kInputTextStyle,
    );
  }
}