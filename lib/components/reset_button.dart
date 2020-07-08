import 'package:credit_card_input_form/constants/captions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetButton extends StatefulWidget {
  final Function onTap;

  ResetButton({this.onTap});

  @override
  _ResetButtonState createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  var pressed = false;

  @override
  Widget build(BuildContext context) {
    final captions = Provider.of<Captions>(context);

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        // final currentState = Provider.of<StateProvider>(context, listen: false)
        //     .getCurrentState();

        // if (currentState == InputState.DONE) {
        //   return;
        // }

        setState(() {
          pressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          pressed = false;
        });
      },
      child: AnimatedContainer(
          margin: EdgeInsets.symmetric(horizontal: pressed ? 2.5 : 0),
          duration: Duration(milliseconds: 100),
          width: 95 - (pressed ? 5.0 : 0.0),
          height: 45 - (pressed ? 5.0 : 0.0),
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54, blurRadius: 5.0, offset: Offset(0, 5))
            ],
            borderRadius: BorderRadius.all(Radius.circular(30)),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                Text(
                  captions.getCaption('RESET'),
                  style: TextStyle(
                      color: pressed ? Colors.grey : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          )),
    );
  }
}
