import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthProvider {
  FirebaseAuth? _firebaseAuth;

  AuthProvider() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  User? getUser() {
    return _firebaseAuth?.currentUser;
  }

  void checkIfUserIsLogged(BuildContext context, String typeUser) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      // User is logged
      if (user != null && typeUser != null) {
        if (typeUser == 'client') {
          Navigator.pushNamedAndRemoveUntil(context, 'client/map', (route) => false);
        } else if (typeUser == 'driver') {
          Navigator.pushNamedAndRemoveUntil(context, 'driver/map', (route) => false);
        }
      }
    });
  }

  Future<bool> login(String email, String password) async {
    String errorMessage;

    try {
      await _firebaseAuth?.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (error) {
      print('Error: ${error.code} \n ${error.message}');
      errorMessage = error.code;
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    String errorMessage;

    try {
      await _firebaseAuth?.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (error) {
      if (kDebugMode) {
        print('Error: ${error.code} \n ${error.message}');
      }
      errorMessage = error.code;
      return false;
    }
  }

  Future signOut() async {
    return Future.wait([_firebaseAuth!.signOut()]);
  }
}