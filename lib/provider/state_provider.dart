import 'package:flutter/material.dart';
import 'package:flutter_credit_card/constanst.dart';

class StateProvider with ChangeNotifier {
  var _currentState = InputState.number;

  void moveNextState() {
    if (InputState.number == _currentState) {
      _currentState = InputState.name;
    } else if (InputState.name == _currentState) {
      _currentState = InputState.validate;
    } else {
      _currentState = InputState.CVC;
    }
    print(_currentState);
    notifyListeners();
  }

  InputState getCurrentState() {
    return _currentState;
  }
}
