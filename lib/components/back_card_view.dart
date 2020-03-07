import 'package:flutter/material.dart';

import '../constanst.dart';
import 'card_cvv.dart';
import 'card_sign.dart';

class BackCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 200,
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54, blurRadius: 15.0, offset: Offset(0, 8))
          ],
          color: const Color(0xFF5D5D5E),
          borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 25),
            height: 35,
            color: Colors.black,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: CardSign()),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(right: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.yellow, //                   <--- border color
                    width: 1.0,
                  ),
                ),
                child: CardCVV(),
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'images/mastercard.png',
                  width: 50,
                ),
              )),
        ],
      ),
    );
  }
}

