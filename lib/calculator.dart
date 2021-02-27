import 'package:flutter/material.dart';
import 'dart:math';

Map calculate(int w, int h) {
  double _bmi = w / (pow(h / 100, 2));
  _bmi = double.parse((_bmi).toStringAsFixed(1));

  String _text, _explanation;
  Color _resultColour;

  if (_bmi < 18.5) {
    _explanation = 'You have a lower than normal body weight. Try to eat more.';
    _text = 'Under-Weight';
    _resultColour = Colors.yellow;
  } else if (_bmi > 25) {
    _explanation =
        'You have a higher than normal body weight. Try to exercise more.';
    _text = 'Over-Weight';
    _resultColour = Colors.red;
  } else {
    _explanation = 'You have a normal body weight. Keep up the good work.';
    _text = 'Normal';
    _resultColour = Colors.green;
  }
  return {
    'text': _text,
    'resultColour': _resultColour,
    'explanation': _explanation,
    'bmi': _bmi
  };
}
