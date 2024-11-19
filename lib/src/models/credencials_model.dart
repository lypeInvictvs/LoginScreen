import 'package:flutter/material.dart';

class CredentialsModel extends ChangeNotifier {
  String email;
  String password;

  CredentialsModel({
    this.email = '',
    this.password = '',
  });

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  String showCredential() {
    return "$email | $password";
  }
}
