import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  bool _isloading = false;
  bool get isloading => _isloading;
  set isloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  bool _obscureText = true;
  bool get obscureText => _obscureText;
  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState!.validate();
  }
  
}