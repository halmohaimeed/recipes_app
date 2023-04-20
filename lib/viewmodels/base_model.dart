import 'package:flutter/material.dart';

enum ViewState { Idle, Busy, Error }

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  String _error = '';

  ViewState get state => _state;
  String get error => _error;

  void setError(String error){
    _error = error;
    _state = ViewState.Error;
    notifyListeners();
  }

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}