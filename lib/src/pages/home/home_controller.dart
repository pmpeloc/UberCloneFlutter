import 'package:flutter/material.dart';
import 'package:uber_clone_flutter/src/utils/shared_pref.dart';

class HomeController {
  BuildContext? context;
  SharedPref? _sharedPref;

  Future? init(BuildContext context) {
    this.context = context;
    _sharedPref = SharedPref();
  }

  void goToLoginPage(String typeUser) {
    saveTypeUserClient(typeUser);
    Navigator.pushNamed(context!, 'login');
  }

  saveTypeUserClient(String typeUser) {
     _sharedPref?.save('typeUser', typeUser);
     Navigator.pushNamed(context!, 'login');
  }
}