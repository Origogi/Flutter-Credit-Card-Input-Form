import 'package:flutter/material.dart';
import 'package:flutter_credit_card/provider/card_cvv_provider.dart';
import 'package:provider/provider.dart';

import '../constanst.dart';

class CardCVV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardCVVProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            height: 40,
            width: 70,
            color: Colors.white,
            child: Center(
              child: Text(
                value.cardCVV,
                style: kCVCTextStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
