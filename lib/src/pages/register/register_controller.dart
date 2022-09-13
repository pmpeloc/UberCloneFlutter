import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone_flutter/src/providers/auth_provider.dart';

class RegisterController {
  BuildContext? context;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  AuthProvider? _authProvider;

  Future? init (BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
  }

  void register() async {
    String username = emailController.text;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirm = passwordConfirmController.text.trim();
    if (username.isEmpty && email.isEmpty && password.isEmpty && passwordConfirm.isEmpty) {
      return;
    }
    if (passwordConfirm != password) {
      return;
    }
    if (password.length < 6) {
      if (kDebugMode) {
        print('Password length is invalid');
      }
      return;
    }
    try {
      bool? isRegister = await _authProvider?.register(email, password);
      if (isRegister == true) {
        if (kDebugMode) {
          print('Register success');
        }
      } else {
        if (kDebugMode) {
          print('Register fail');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}