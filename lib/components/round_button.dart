import 'package:flutter/material.dart';
import 'package:flutter_credit_card/constanst.dart';
import 'package:flutter_credit_card/provider/state_provider.dart';
import 'package:provider/provider.dart';

class RoundButton extends StatelessWidget {
  final Function onTap;

  RoundButton({this.onTap});

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
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Consumer<StateProvider>(
            builder: (context, notifier, child) {
              return Text(
                notifier.getCurrentState() == InputState.CVV ? 'Done' : 'Next',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              );
            },
          ),
        ),
      ),
    );
  }
}
