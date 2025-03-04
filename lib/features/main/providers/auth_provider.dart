import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      await FirebaseFirestore.instance.collection('users').doc(email).set({
        'name': name,
        'email': email,
      });

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      log('error $e');
      notifyListeners();
      rethrow;
    }
  }
}
