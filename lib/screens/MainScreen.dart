import 'package:flutter/material.dart';
import 'package:flutter_credit_card/constanst.dart';
import 'package:flutter_credit_card/provider/my_notifier.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
              CardForm(),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Card Number',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5.0,
                              offset: Offset(0, 5))
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xff6c16c7),
                              const Color(0xFFB16B92),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Provider.of<MyNotifier>(context, listen: false)
                                .moveNextState();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardForm extends StatelessWidget {
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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            YellowBorder(),
            Align(
              alignment: Alignment.centerLeft,
              child: CardNumber(),
            ),
            Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'images/mastercard.png',
                  width: 50,
                )),
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
                    Text(
                      'NAME SURFACE',
                      style: kInputTextStyle,
                    ),
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
                    Text(
                      'MM/YY',
                      style: kInputTextStyle,
                    ),
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

class YellowBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentState = Provider.of<MyNotifier>(context).getCurrentState();

    final align = getAlign(currentState);
    final height = getHeight(currentState);
    final width = getWidth(currentState);

    return AnimatedAlign(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.yellow, //                   <--- border color
            width: 2.0,
          ),
        ),
        height: height,
        width: width,
      ),
      alignment: align,
      duration: Duration(milliseconds: 100),
    );
  }

  Alignment getAlign(currentState) {
    var align = Alignment.centerLeft;
    switch (currentState) {
      case InputState.number:
        align = Alignment.centerLeft;
        break;
      case InputState.name:
        align = Alignment.bottomLeft;
        break;
      case InputState.validate:
        align = Alignment.bottomRight;
        break;
    }
    return align;
  }

  double getHeight(InputState currentState) {
    var height = 330.0;
    switch (currentState) {
      case InputState.number:
        height = 50;
        break;
      case InputState.name:
        height = 37;
        break;
      case InputState.validate:
        height = 37;
        break;
      case InputState.CVS:
        // TODO: Handle this case.
        break;
    }
    return height;
  }

  double getWidth(InputState currentState) {
    var width = 330.0;
    switch (currentState) {
      case InputState.number:
        width = 330;
        break;
      case InputState.name:
        width = 30;
        break;
      case InputState.validate:
        width = 85;
        break;
      case InputState.CVS:
        // TODO: Handle this case.
        break;
    }
    return width;
  }
}

class CardNumber extends StatelessWidget {
  final itemPadding = 20.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 10,
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
