import 'package:flutter/material.dart';

class CardCVVProvider with ChangeNotifier {
  var _cardCVV = '';

  void setCVV(String CVV) {
    _cardCVV = CVV;
    notifyListeners();
  }

  get cardCVV => _cardCVV;
}
