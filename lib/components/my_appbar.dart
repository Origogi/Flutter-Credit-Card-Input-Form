import 'package:flutter/material.dart';

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
