import 'package:flutter/material.dart';

class CardValidProvider with ChangeNotifier {
  var _cardValid = '';

  void setValid(String valid) {
    _cardValid = valid;
    notifyListeners();
  }

  get cardValid => _cardValid;
}
