import 'package:flutter/material.dart';

mixin HideKeyboardOnPress<T extends StatefulWidget> on State<T> {
  void hideKeyboard() {
    FocusScope.of(context).unfocus();
  }
}
