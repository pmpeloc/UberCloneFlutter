import 'package:flutter/material.dart';
import 'package:uber_clone_flutter/src/providers/auth_provider.dart';
import 'package:uber_clone_flutter/src/utils/shared_pref.dart';

class HomeController {
  BuildContext? context;
  SharedPref? _sharedPref;

  AuthProvider? _authProvider;
  String? _typeUser;

  Future? init(BuildContext context) async {
    this.context = context;
    _sharedPref = SharedPref();
    _authProvider = AuthProvider();
    _typeUser = await _sharedPref?.read('typeUser');
    _authProvider?.checkIfUserIsLogged(context, _typeUser!);
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