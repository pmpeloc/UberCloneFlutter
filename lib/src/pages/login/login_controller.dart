import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:uber_clone_flutter/src/models/client.dart';
import 'package:uber_clone_flutter/src/models/driver.dart';
import 'package:uber_clone_flutter/src/providers/auth_provider.dart';
import 'package:uber_clone_flutter/src/providers/client_provider.dart';
import 'package:uber_clone_flutter/src/providers/driver_provider.dart';
import 'package:uber_clone_flutter/src/utils/my_progress_dialog.dart';
import 'package:uber_clone_flutter/src/utils/shared_pref.dart';
import 'package:uber_clone_flutter/src/utils/snackbar.dart' as utils;

class LoginController {
  BuildContext? context;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthProvider? _authProvider;
  ProgressDialog? _progressDialog;
  DriverProvider? _driverProvider;
  ClientProvider? _clientProvider;

  SharedPref? _sharedPref;
  late String _typeUser;

  Future? init (BuildContext context) async {
    this.context = context;
    _authProvider = AuthProvider();
    _progressDialog = MyProgressDialog.createProgressDialog(context, 'Espere un momento...');
    _sharedPref = SharedPref();
    _typeUser = await _sharedPref!.read('typeUser');
    _driverProvider = DriverProvider();
    _clientProvider = ClientProvider();
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    _progressDialog = MyProgressDialog.createProgressDialog(context!, 'Espere un momento...');
    _progressDialog?.show();
    try {
      bool? isLogin = await _authProvider?.login(email, password);
      if (isLogin == true) {
        if (kDebugMode) {
          print('Login success');
        }
        _progressDialog?.hide();
        if (_typeUser == 'client') {
          Client? client = await _clientProvider!.getById(_authProvider!.getUser()!.uid);
          if (client != null) {
            utils.Snackbar.showSnackbar(context!, key, 'Inicio de sesión exitoso.');
            Navigator.pushNamedAndRemoveUntil(context!, 'client/map', (route) => false);
          } else {
            utils.Snackbar.showSnackbar(context!, key, 'El usuario no es válido.');
            await _authProvider!.signOut();
          }
        } else if (_typeUser == 'driver') {
          print('es un driver');
          utils.Snackbar.showSnackbar(context!, key, 'Inicio de sesión exitoso.');
          Navigator.pushNamedAndRemoveUntil(context!, 'driver/map', (route) => false);
          // Driver driver = Driver.fromJson({"plate": "WSR-589", "id": "12zyWdNWgvXlJxJXuWQc5a0gWKH2", "email": "test3@mail.com", "username": "test3@mail.com"});
          // print('Driver: $driver');
          // if (driver != null) {
          //   print('no es null driver');
          //   utils.Snackbar.showSnackbar(context!, key, 'Inicio de sesión exitoso.');
          //   Navigator.pushNamedAndRemoveUntil(context!, 'driver/map', (route) => false);
          // } else {
          //   print('es null driver');
          //   utils.Snackbar.showSnackbar(context!, key, 'El usuario no es válido.');
          //   await _authProvider!.signOut();
          // }
        }
      } else {
        if (kDebugMode) {
          print('Login fail');
        }
        _progressDialog?.hide();
        utils.Snackbar.showSnackbar(context!, key, 'Email y/o contraseña incorrectos.');
      }
    } catch (error) {
      _progressDialog?.hide();
      utils.Snackbar.showSnackbar(context!, key, 'Error: $error');
      if (kDebugMode) {
        print(error);
      }
    }
  }

  void goToRegisterPage() {
    if (_typeUser == 'client') {
      Navigator.pushNamed(context!, 'client/register');
    } else {
      Navigator.pushNamed(context!, 'driver/register');
    }
  }
}