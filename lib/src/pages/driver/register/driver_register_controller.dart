import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:uber_clone_flutter/src/models/driver.dart';
import 'package:uber_clone_flutter/src/providers/auth_provider.dart';
import 'package:uber_clone_flutter/src/providers/driver_provider.dart';
import 'package:uber_clone_flutter/src/utils/my_progress_dialog.dart';
import 'package:uber_clone_flutter/src/utils/snackbar.dart' as utils;

class DriverRegisterController {
  BuildContext? context;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  TextEditingController pin1Controller = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  TextEditingController pin3Controller = TextEditingController();
  TextEditingController pin4Controller = TextEditingController();
  TextEditingController pin5Controller = TextEditingController();
  TextEditingController pin6Controller = TextEditingController();

  AuthProvider? _authProvider;
  DriverProvider? _driverProvider;
  ProgressDialog? _progressDialog;

  Future? init (BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
    _driverProvider = DriverProvider();
    _progressDialog = MyProgressDialog.createProgressDialog(context, 'Espere un momento...');
  }

  void register() async {
    String username = emailController.text;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirm = passwordConfirmController.text.trim();

    String pin1 = pin1Controller.text.trim();
    String pin2 = pin2Controller.text.trim();
    String pin3 = pin3Controller.text.trim();
    String pin4 = pin4Controller.text.trim();
    String pin5 = pin5Controller.text.trim();
    String pin6 = pin6Controller.text.trim();

    String plate = '$pin1$pin2$pin3-$pin4$pin5$pin6';

    if (username.isEmpty && email.isEmpty && password.isEmpty && passwordConfirm.isEmpty) {
      utils.Snackbar.showSnackbar(context!, key, 'Debes ingresar todos los campos');
      return;
    }
    if (passwordConfirm != password) {
      utils.Snackbar.showSnackbar(context!, key, 'Las contraseñas no coinciden');
      return;
    }
    if (password.length < 6) {
      utils.Snackbar.showSnackbar(context!, key, 'El password debe tener al menos 6 caracteres');
      return;
    }

    _progressDialog?.show();

    try {
      bool? isRegister = await _authProvider?.register(email, password);
      if (isRegister == true) {
        if (kDebugMode) {
          print('Register success');
        }

        Driver driver = Driver(
          id: _authProvider!.getUser()!.uid,
          email: _authProvider!.getUser()!.email!,
          username: username,
          password: password,
          plate: plate,
        );

        await _driverProvider?.create(driver);
        _progressDialog?.hide();
        Navigator.pushNamedAndRemoveUntil(context!, 'driver/map', (route) => false);
        utils.Snackbar.showSnackbar(context!, key, 'Conductor creado correctamente.');
      } else {
        _progressDialog?.hide();
        if (kDebugMode) {
          print('Register fail');
        }
      }
    } catch (error) {
      _progressDialog?.hide();
      utils.Snackbar.showSnackbar(context!, key, 'Error: $error');
      if (kDebugMode) {
        print(error);
      }
    }
  }
}