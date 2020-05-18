import 'package:flutter/material.dart';
import 'package:credit_card_input_form/components/yellow_border.dart';
import 'package:credit_card_input_form/constants/constanst.dart';
import 'card_logo.dart';
import 'card_name.dart';
import 'card_number.dart';
import 'card_valid.dart';

class FrondCardView extends StatelessWidget {

  final height;

  FrondCardView({this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      height: height,
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54, blurRadius: 15.0, offset: Offset(0, 8))
          ],
          color: const Color(0xFF5D5D5E),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            YellowBorder(),
            Align(
              alignment: Alignment.centerLeft,
              child: CardNumber(),
            ),
            Align(alignment: Alignment.topRight, child: CardLogo()),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'CARDHOLDER NAME',
                      style: kTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CardName(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'VALID THRU',
                      style: kTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CardValid(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
