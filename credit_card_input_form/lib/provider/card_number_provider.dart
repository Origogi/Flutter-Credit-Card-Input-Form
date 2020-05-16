import 'package:flutter/material.dart';

class CardNumberProvider with ChangeNotifier {
  var _cardNumber = '';

  void setNumber(String inputNumber) {
    _cardNumber = inputNumber;
    notifyListeners();
  }

  get cardNumber => _cardNumber;
}
