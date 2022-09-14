import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone_flutter/src/models/client.dart';

class ClientProvider {
  late CollectionReference _ref;

  ClientProvider() {
    _ref = FirebaseFirestore.instance.collection('Clients');
  }

  Future<void> create(Client client) {
    String errorMessage;
    try {
      return _ref.doc(client.id).set(client.toJson());
    } catch (error) {
      errorMessage = error.hashCode.toString();
      return Future.error(errorMessage);
    }
  }

  Future<Client?> getById(String id) async {
    DocumentSnapshot document = await _ref.doc(id).get();
    if (document.exists) {
      Client client = Client.fromJson(document.data() as Map<String, dynamic>);
      return client;
    }
    return null;
  }
}