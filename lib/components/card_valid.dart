import 'package:flutter/material.dart';
import 'package:flutter_credit_card/provider/card_valid_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_credit_card/constanst.dart';

class CardValid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String inputCardValid = Provider.of<CardValidProvider>(context).cardValid;

    inputCardValid = inputCardValid.replaceAll("/", "");

    var defaultCardValid = '';

    switch (inputCardValid.length) {
      case 0:
        defaultCardValid = 'MM/YY';
        break;
      case 1:
        defaultCardValid = 'M/YY';
        break;
      case 2:
        defaultCardValid = '/YY';
        break;
      case 3:
        inputCardValid =
            inputCardValid[0] + inputCardValid[1] + '/' + inputCardValid[2];
        defaultCardValid = 'Y';
        break;
      case 4:
        inputCardValid = inputCardValid[0] +
            inputCardValid[1] +
            '/' +
            inputCardValid[2] +
            inputCardValid[3];
        defaultCardValid = '';
        break;
    }

    print(defaultCardValid);

    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          inputCardValid,
          style: kValidtextStyle,
        ),
        Text(
          defaultCardValid,
          style: kDefaultValidTextStyle,
        )
      ],
    ));
  }
}
