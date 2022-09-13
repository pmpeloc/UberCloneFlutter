import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthProvider {
  FirebaseAuth? _firebaseAuth;

  AuthProvider() {
    _firebaseAuth = FirebaseAuth.instance;
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
}