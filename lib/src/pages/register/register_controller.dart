import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone_flutter/src/models/client.dart';
import 'package:uber_clone_flutter/src/providers/auth_provider.dart';
import 'package:uber_clone_flutter/src/providers/client_provider.dart';

class RegisterController {
  BuildContext? context;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  AuthProvider? _authProvider;
  ClientProvider? _clientProvider;

  Future? init (BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
    _clientProvider = ClientProvider();
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

        Client client = Client(
          id: _authProvider!.getUser()!.uid,
          email: _authProvider!.getUser()!.email!,
          username: username,
          password: password
        );

        await _clientProvider?.create(client);
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