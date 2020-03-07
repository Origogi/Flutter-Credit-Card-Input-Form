import 'package:flutter/material.dart';

import '../constanst.dart';

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
              child: Container(
                margin: EdgeInsets.only(left: 25),
                height: 40,
                width: 220,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    'Kim jeongtae',
                    style: kSignTextStyle,
                  ),
                ),
              )),
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
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 40,
                    width: 70,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        '123',
                        style: kCVCTextStyle,
                      ),
                    ),
                  ),
                ),
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
