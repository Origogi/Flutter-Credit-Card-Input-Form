import 'package:flutter/material.dart';
import 'package:flutter_credit_card/provider/state_provider.dart';
import 'package:flutter_credit_card/util/util.dart';
import 'package:provider/provider.dart';

import '../constanst.dart';

class YellowBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentState = Provider.of<StateProvider>(context).getCurrentState();

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
      case InputState.CVC:
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
        height = textSize('1234  5678  1234', kCardNumberTextStyle).height + 15;
        break;
      case InputState.name:
        height = textSize('hello world', kInputTextStyle).height + 15;
        break;
      case InputState.CVC:
      case InputState.validate:
        height = textSize('12/12', kInputTextStyle).height + 15;
        break;
    }
    return height;
  }

  double getWidth(InputState currentState) {
    var width = 330.0;
    switch (currentState) {
      case InputState.number:
        width = textSize('1234  5678  1234  1234', kCardNumberTextStyle).width + 40;
        break;
      case InputState.name:
        width = textSize('jeongtae kim', kInputTextStyle).width + 15;
        break;
      case InputState.CVC:
      case InputState.validate:
        width = textSize('MM/YY', kInputTextStyle).width + 20;
        break;
        break;
    }
    return width;
  }
}
