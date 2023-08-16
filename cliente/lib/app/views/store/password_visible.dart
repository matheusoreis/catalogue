import 'package:flutter_triple/flutter_triple.dart';

class PasswordVisibleController extends Store<bool> {
  PasswordVisibleController() : super(false);

  void changeBool() {
    bool passwordVisible = !state;
    update(passwordVisible);
  }
}
