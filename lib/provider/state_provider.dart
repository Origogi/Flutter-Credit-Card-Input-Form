import 'package:flutter/material.dart';
import 'package:credit_card_input_form/constants/constanst.dart';

class StateProvider with ChangeNotifier {
  InputState? _currentState;

  StateProvider(initValue) {
    _currentState = initValue;
  }

  final _states = [
    InputState.NUMBER,
    InputState.NAME,
    InputState.VALIDATE,
    InputState.CVV,
    InputState.DONE
  ];

  void moveNextState() {
    if (_currentState!.index < _states.length - 1) {
      _currentState = _states[_currentState!.index + 1];
      notifyListeners();
    }
  }

  void moveFirstState() {
    _currentState = _states[0];
    notifyListeners();
  }

  void movePrevState() {
    if (_currentState!.index > 0) {
      _currentState = _states[_currentState!.index - 1];
      notifyListeners();
    }
  }

  InputState? getCurrentState() {
    return _currentState;
  }
}
