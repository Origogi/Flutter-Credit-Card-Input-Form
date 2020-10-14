import 'package:flutter/material.dart';

class CardCVVProvider with ChangeNotifier {
  var _cardCVV;

  CardCVVProvider(initValue) {
    _cardCVV = initValue;
  }

  void setCVV(String cvv) {
    _cardCVV = cvv;
    notifyListeners();
  }

  get cardCVV => _cardCVV;
}
