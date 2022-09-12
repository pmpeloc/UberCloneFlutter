// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uber_clone_flutter/utils/colors.dart' as utils;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            _bannerApp(),
            _textDescription(),
            _textLogin(),
            Expanded(child: Container()),
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin(),
            _textDontHaveAccount()
          ],
        ));
  }

  Widget _textDontHaveAccount() {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      child: Text(
        'No tienes cuenta?',
        style: TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Iniciar Sesión'),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
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

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
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

  Widget _textLogin() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Login',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
      ),
    );
  }

  Widget _textDescription() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Continua con tu',
        style: TextStyle(
            color: Colors.black54, fontSize: 24, fontFamily: 'NimbusSans'),
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
