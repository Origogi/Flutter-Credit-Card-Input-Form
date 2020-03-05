import 'package:flutter/material.dart';
import 'package:flutter_credit_card/constanst.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MyAppbar(),
              Container(
                
                margin: EdgeInsets.symmetric(vertical: 30),
                height: 250,
                
                decoration: BoxDecoration(
                    color: const Color(0xFF5D5D5E),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CardNumber(),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: Image.asset('images/mastercard.png')),
                      Align(
                        alignment: Alignment.bottomLeft,
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
                            Text('NAME SURFACE', style: kInputTextStyle,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardNumber extends StatelessWidget {
  final itemPadding = 25.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '1234',
          style: kNumberFont,
        ),
        SizedBox(
          width: itemPadding,
        ),
        Text(
          '1234',
          style: kNumberFont,
        ),
        SizedBox(
          width: itemPadding,
        ),
        Text(
          '1234',
          style: kNumberFont,
        ),
        SizedBox(
          width: itemPadding,
        ),
        Text(
          '1234',
          style: kNumberFont,
        )
      ],
    );
  }
}

class MyAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.clear, color: Colors.black), onPressed: null),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
              color: const Color(0xFFDADFE5),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Scan your card   ',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.camera_alt)
            ],
          ),
        )
      ],
    );
  }
}
