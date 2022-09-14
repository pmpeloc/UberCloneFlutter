import 'package:flutter/material.dart';
import 'package:uber_clone_flutter/src/providers/auth_provider.dart';
import 'package:uber_clone_flutter/src/utils/shared_pref.dart';

class HomeController {
  late BuildContext context;
  late SharedPref _sharedPref;

  late AuthProvider _authProvider;
  late String _typeUser;

  Future? init(BuildContext context) async {
    this.context = context;
    _sharedPref = SharedPref();
    _authProvider = AuthProvider();
    _typeUser = await _sharedPref.read('typeUser');
    if (_typeUser != null) {
      _authProvider.checkIfUserIsLogged(context, _typeUser!);
    }
  }

  void goToLoginPage(String typeUser) {
    saveTypeUserClient(typeUser);
    Navigator.pushNamed(context, 'login');
  }

  saveTypeUserClient(String typeUser) {
     _sharedPref.save('typeUser', typeUser);
     Navigator.pushNamed(context, 'login');
  }
}