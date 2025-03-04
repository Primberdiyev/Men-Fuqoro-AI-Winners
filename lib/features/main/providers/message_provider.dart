import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/main/laws/mehnat_kodeksi.dart';
import 'package:men_fuqoro_ai/features/main/models/law_model.dart';

class MessageProvider extends ChangeNotifier {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<void> sendResponse(
      {required String text,
      required bool isResponse,
      LawModel? answer}) async {
    try {
      final time = DateTime.now().millisecondsSinceEpoch;
      await firebaseFirestore.collection('responses').doc(time.toString()).set(
        {
          'response': text,
          'isResponse': isResponse,
        },
        SetOptions(
          merge: true,
        ),
      );
    } catch (e) {
      log('error on sending response to Firebase $e');
    }
  }

  Future<void> sendAnswer({
    required List<LawModel> answer,
    required bool isResponse,
  }) async {
    try {
      final time = DateTime.now().millisecondsSinceEpoch;
      await firebaseFirestore.collection('responses').doc(time.toString()).set(
        {
          'answer': answer.map((e) => e.toJson()).toList(),
          'isResponse': isResponse,
        },
        SetOptions(
          merge: true,
        ),
      );
    } catch (e) {
      log('error on sending response to Firebase $e');
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages() {
    return firebaseFirestore.collection('responses').snapshots();
  }

  List<LawModel> filterLaw(String text) {
    List<LawModel> newLaws = [];
    for (var law in laws) {
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

}
