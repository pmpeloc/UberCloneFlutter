import 'package:cloud_firestore/cloud_firestore.dart';
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
}