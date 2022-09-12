import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone_flutter/src/providers/auth_provider.dart';

class LoginController {
  BuildContext? context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  AuthProvider? _authProvider;

  Future? init (BuildContext context) {
    this.context = context;
    _authProvider = new AuthProvider();
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (kDebugMode) {
      print({email, password});
    }
    try {
      bool? isLogin = await _authProvider?.login(email, password);
      if (isLogin == true) {
        if (kDebugMode) {
          print('Login success');
        }
      } else {
        if (kDebugMode) {
          print('Login fail');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}