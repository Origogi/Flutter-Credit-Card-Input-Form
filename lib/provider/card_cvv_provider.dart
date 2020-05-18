import 'package:flutter/material.dart';

class CardCVVProvider with ChangeNotifier {
  var _cardCVV = '';

  void setCVV(String cvv) {
    _cardCVV = cvv;
    notifyListeners();
  }

  get cardCVV => _cardCVV;
}
