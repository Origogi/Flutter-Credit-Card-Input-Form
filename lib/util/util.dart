import 'package:flutter/material.dart';
import 'package:flutter_credit_card/constanst.dart';

Size textSize(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}

CardCompany getCardCompany (String number) {
  
}