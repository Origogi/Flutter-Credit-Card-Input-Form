import 'package:flutter/material.dart';
import 'package:credit_card_input_form/constants/constanst.dart';
import 'package:credit_card_input_form/provider/state_provider.dart';
import 'package:provider/provider.dart';

class RoundButton extends StatefulWidget {
  final Function onTap;
  final buttonTitle;

  RoundButton({this.onTap, this.buttonTitle});

  @override
  _RoundButtonState createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  var pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {

        final currentState =
            Provider.of<StateProvider>(context, listen: false).getCurrentState();

        if (currentState == InputState.DONE) {
          return;
        }

        setState(() {
          pressed = true;
        });
      },

      onTapUp: (_) {
        final currentState =
            Provider.of<StateProvider>(context, listen: false).getCurrentState();

        if (currentState == InputState.DONE) {
          return;
        }

        setState(() {
          pressed = false;
        });
      },
      child: AnimatedContainer(
          margin: EdgeInsets.symmetric(horizontal: pressed ? 2.5 : 0),
          duration: Duration(milliseconds: 100),
          width: 75 - (pressed ? 5.0 : 0.0),
          height: 40 - (pressed ? 5.0 : 0.0),
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
          child: Center(
            child: Text(
              widget.buttonTitle,
              style: TextStyle(
                  color: pressed ? Colors.grey : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          )),
    );
  }
}
