import 'package:flutter/material.dart';

class CardNameProvider with ChangeNotifier {
  var _cardName;

  CardNameProvider(initValue) {
    _cardName = initValue;
  }

  void setName(String name) {
    _cardName = name;
    notifyListeners();
  }

  get cardName => _cardName;
}
