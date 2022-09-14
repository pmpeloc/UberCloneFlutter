import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone_flutter/src/models/driver.dart';

class DriverProvider {
  late CollectionReference _ref;

  DriverProvider() {
    _ref = FirebaseFirestore.instance.collection('Drivers');
  }

  Future<void> create(Driver driver) {
    String errorMessage;
    try {
      return _ref.doc(driver.id).set(driver.toJson());
    } catch (error) {
      errorMessage = error.hashCode.toString();
      return Future.error(errorMessage);
    }
  }

  Future<Driver?> getById(String id) async {
    print('Entro a getId');
    DocumentSnapshot document = await _ref.doc(id).get();
    if (document.exists) {
      print(document.data());
      print('iniciando el armado del driver json');
      final data = document.data()! as Map<String, dynamic>;
      print('Data: $data');
      Driver driver = Driver.fromJson({"plate": "WSR-589", "id": "12zyWdNWgvXlJxJXuWQc5a0gWKH2", "email": "test3@mail.com", "username": "test3@mail.com"});
      print('Driver: $driver');
      print('Retorna el driver');
      return driver;
    }
    print('retorna null');
    return null;
  }
}