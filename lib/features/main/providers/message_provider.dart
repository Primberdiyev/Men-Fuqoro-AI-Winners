import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/core/services/hive_services.dart';
import 'package:men_fuqoro_ai/features/main/laws/jinoyat_kodeksi.dart';
import 'package:men_fuqoro_ai/features/main/laws/mehnat_kodeksi.dart';
import 'package:men_fuqoro_ai/features/main/models/law_model.dart';
import 'package:men_fuqoro_ai/features/main/models/user_model.dart';

class MessageProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  UserModel? userModel;
  Future<void> sendResponse({
    required String text,
    required bool isResponse,
  }) async {
    try {
      final time = DateTime.now().millisecondsSinceEpoch.toString();
      await firebaseFirestore
          .collection('users')
          .doc(userModel?.email)
          .collection('responses')
          .doc(time)
          .set(
        {
          'response': text,
          'isResponse': isResponse,
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      log('Error sending response to Firebase: $e');
    }
  }

  Future<void> sendAnswer({
    required List<LawModel> answer,
    required bool isResponse,
  }) async {
    try {
      final time = DateTime.now().millisecondsSinceEpoch.toString();
      await firebaseFirestore
          .collection('users')
          .doc(userModel?.email)
          .collection('responses')
          .doc(time)
          .set(
        {
          'answer': answer.map((e) => e.toJson()).toList(),
          'isResponse': isResponse,
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      log('Error sending answer to Firebase: $e');
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages() {
    return firebaseFirestore
        .collection('users')
        .doc(userModel?.email)
        .collection('responses')
        .snapshots();
  }

  List<LawModel> filterLaw(String text) {
    List<LawModel> newLaws = [];
    final listOfLaws = lawsMehnat + lawsCrime;
    for (var law in listOfLaws) {
      int count = 0;
      for (var l in law.lawDescription) {
        if (!text.contains(l)) {
          count++;
        }
      }
      if (count == 0) {
        newLaws.add(law);
      }
    }
    return newLaws;
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      await firebaseFirestore.collection('users').doc(email).set({
        'name': name,
        'email': email,
      });

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      log('Error on signing up: $e');
      notifyListeners();
      rethrow;
    }
  }

  void getUserModel() {
    userModel = HiveServices().getUser();
    notifyListeners();
  }
}
