// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uber_clone_flutter/src/pages/driver/register/driver_register_controller.dart';
import 'package:uber_clone_flutter/src/utils/colors.dart' as utils;
import 'package:uber_clone_flutter/src/widgets/button_app.dart';
import 'package:uber_clone_flutter/src/utils/otp_widget.dart';

class DriverRegisterPage extends StatefulWidget {
  const DriverRegisterPage({Key? key}) : super(key: key);

  @override
  State<DriverRegisterPage> createState() => _DriverRegisterPageState();
}

class _DriverRegisterPageState extends State<DriverRegisterPage> {
  final DriverRegisterController _con = DriverRegisterController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.key,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _bannerApp(),
              _textRegister(),
              _textLicencePlate(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: OTPFields(
                  pin1: _con.pin1Controller,
                  pin2: _con.pin2Controller,
                  pin3: _con.pin3Controller,
                  pin4: _con.pin4Controller,
                  pin5: _con.pin5Controller,
                  pin6: _con.pin6Controller,
                ),
              ),
              _textFieldUsername(),
              _textFieldEmail(),
              _textFieldPassword(),
              _textFieldConfirmPassword(),
              _buttonRegister(),
            ],
          ),
        ));
  }

  Widget _buttonRegister() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: ButtonApp(
            onPressed: _con.register,
            color: utils.Colors.uberCloneColor,
            text: 'Crear Cuenta'));
  }

  Widget _textLicencePlate() {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          'Patente del Vehículo',
          style: TextStyle(color: Colors.grey[600], fontSize: 17),
        ));
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.emailController,
        decoration: InputDecoration(
            hintText: 'mail@mail.com',
            labelText: 'Correo Electrónico',
            suffixIcon: Icon(
              Icons.email_outlined,
              color: utils.Colors.uberCloneColor,
            )),
      ),
    );
  }

  Widget _textFieldUsername() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextField(
        controller: _con.usernameController,
        decoration: InputDecoration(
            hintText: 'John Doe',
            labelText: 'Nombre de Usuario',
            suffixIcon: Icon(
              Icons.person_outlined,
              color: utils.Colors.uberCloneColor,
            )),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Contraseña',
            suffixIcon: Icon(
              Icons.lock_open_outlined,
              color: utils.Colors.uberCloneColor,
            )),
      ),
    );
  }

  Widget _textFieldConfirmPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
        controller: _con.passwordConfirmController,
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Repita la Contraseña',
            suffixIcon: Icon(
              Icons.lock_open_outlined,
              color: utils.Colors.uberCloneColor,
            )),
      ),
    );
  }

  Widget _textRegister() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Text(
        'REGISTRO',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }

  Widget _bannerApp() {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        color: utils.Colors.uberCloneColor,
        height: MediaQuery.of(context).size.height * 0.22,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/logo_app.png',
              width: 150,
              height: 100,
            ),
            Text(
              'Fácil y Rápido',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
