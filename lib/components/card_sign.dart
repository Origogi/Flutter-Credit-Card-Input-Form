import 'package:flutter/material.dart';
import 'package:credit_card_input_form/provider/card_name_provider.dart';
import 'package:provider/provider.dart';
import 'package:credit_card_input_form/constants/constanst.dart';

class CardSign extends StatelessWidget {
  const CardSign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CardNameProvider>(
      builder: (context, provider, child) {
        String cardName = provider.cardName;

        if (cardName.isNotEmpty) {
          cardName = cardName
              .split(' ')
              .map((e) => e.isNotEmpty
                  ? '${e[0].toUpperCase()}${e.substring(1).toLowerCase()}'
                  : e)
              .join(' ');
        }

        return Container(
          margin: EdgeInsets.only(left: 25),
          height: 40,
          width: 220,
          color: Colors.grey,
          child: Center(
            child: Text(
              cardName,
              style: kSignTextStyle,
            ),
          ),
        );
      },
    );
  }
}
