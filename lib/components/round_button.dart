import 'package:flutter/material.dart';
import 'package:credit_card_input_form/constants/constanst.dart';
import 'package:credit_card_input_form/provider/state_provider.dart';
import 'package:provider/provider.dart';

import '../constants/constanst.dart';

class RoundButton extends StatefulWidget {
  final Function? onTap;
  final buttonTitle;
  final decoration;
  final textStyle;

  RoundButton({this.onTap, this.buttonTitle, this.decoration, this.textStyle});

  @override
  _RoundButtonState createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  var pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap as void Function()?,
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
        decoration: widget.decoration,
        child: Center(
          child: Text(widget.buttonTitle,
              style: widget.textStyle.copyWith(
                  color: !pressed
                      ? widget.textStyle.color
                      : widget.textStyle.color.withOpacity(0.2))),
        ),
      ),
    );
  }
}
