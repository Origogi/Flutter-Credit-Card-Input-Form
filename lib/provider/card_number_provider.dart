import 'package:flutter/material.dart';

class CardNumberProvider with ChangeNotifier {
  var _cardNumber = '';

  void setNumber(String newValue) {
    if (newValue.isNotEmpty && newValue[newValue.length - 1] == ' ') {
      _cardNumber = newValue.substring(0, newValue.length - 1);
    } else {
      newValue = newValue.replaceAll(" ", "");
      String cardNumber = "";

      for (int i = 1; i <= newValue.length; i++) {
        cardNumber = cardNumber + newValue[i - 1];
        if (i % 4 == 0 && i != newValue.length) {
          cardNumber = cardNumber + ' ';
        }
      }
      _cardNumber = cardNumber;
    }

    notifyListeners();
  }

  get cardNumber => _cardNumber;
}
