import 'package:flutter/material.dart';
import 'package:flutter_credit_card/constanst.dart';
import 'package:flutter_credit_card/provider/my_notifier.dart';
import 'package:flutter_credit_card/util/util.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController controller = PageController();

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
              Container(
                  height: 120,
                  child: PageView.builder(
                      physics:  NeverScrollableScrollPhysics(),
                      controller: PageController(
                        viewportFraction: 0.9,
                        initialPage: 0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InputForm(title: 'Card number $index'),
                        );
                      },
                      itemCount: 6)),
              Align(
                alignment: Alignment.centerRight,
                child: RoundButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputForm extends StatelessWidget {
  final String title;

  InputForm({@required this.title});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black54, blurRadius: 5.0, offset: Offset(0, 5))
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
          Provider.of<MyNotifier>(context, listen: false).moveNextState();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Text(
            'Next',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
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
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.yellow, //                   <--- border color
            width: 1.0,
          ),
        ),
        height: height,
        width: width,
      ),
      alignment: align,
      duration: Duration(milliseconds: 300),
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
    var height = 0.0;
    switch (currentState) {
      case InputState.number:
        height = textSize('1234  5678  1234', kNumberFont).height + 15;
        break;
      case InputState.name:
        height = textSize('hello world', kInputTextStyle).height + 15;
        break;
      case InputState.validate:
        height = textSize('12/12', kInputTextStyle).height + 15;
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
        width = textSize('1234  5678  1234  1234', kNumberFont).width + 15;
        break;
      case InputState.name:
        //TODO 동적으로 입력 받은 값으로 변경
        width = textSize('jeongtae kim', kInputTextStyle).width + 15;
        break;
      case InputState.validate:
        width = textSize('MM/YY', kInputTextStyle).width + 15;
        break;
      case InputState.CVS:
        // TODO: Handle this case.
        break;
    }
    return width;
  }
}

class CardNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String number = '1234  1234  1234  1234';
    final text = Container(
      padding: EdgeInsets.only(left: 5),
      child: Text(
        number,
        style: kNumberFont,
      ),
    );

    return text;
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
