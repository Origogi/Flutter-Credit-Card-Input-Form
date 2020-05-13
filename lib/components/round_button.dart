import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  final Function onTap;
  final buttonTitle;

  RoundButton({this.onTap, this.buttonTitle});

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
        child: Container(
            width: 75,
            height: 40,
            child: Center(
              child: Text(
                buttonTitle,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            )),
      ),
    );
  }
}
