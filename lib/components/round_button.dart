import 'package:flutter/material.dart';
import 'package:credit_card_input_form/constants/constanst.dart';
import 'package:credit_card_input_form/provider/state_provider.dart';
import 'package:provider/provider.dart';

class RoundButton extends StatefulWidget {
  final Function onTap;
  final buttonTitle;
  final style;

  RoundButton({this.onTap, this.buttonTitle, this.style});

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
        final currentState = Provider.of<StateProvider>(context, listen: false)
            .getCurrentState();

        if (currentState == InputState.DONE) {
          return;
        }

        setState(() {
          pressed = true;
        });
      },
      onTapUp: (_) {
        final currentState = Provider.of<StateProvider>(context, listen: false)
            .getCurrentState();

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
        decoration: widget.style,
        child: Center(
          child: Text(
            widget.buttonTitle,
            style: TextStyle(
                color: pressed ? Colors.grey : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        ),
      ),
    );
  }
}
