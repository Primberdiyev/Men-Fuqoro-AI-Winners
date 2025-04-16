import 'package:flutter/services.dart';
import 'package:men_fuqoro_ai/features/main/models/question_answer_model.dart';
import 'package:string_similarity/string_similarity.dart';

class QonunService {
  static List<QonunSavol> _savollar = [];

  static Future<void> initialize() async {
    final data = await rootBundle.loadString('assets/mehnat_qonuni.csv');
    final lines = data.split('\n');

    _savollar =
        lines.skip(1).where((line) => line.trim().isNotEmpty).map((line) {
      final parts = _parseCsvLine(line);
      if (parts.length >= 3) {
        return QonunSavol(
          savol: parts[0],
          qaysiModda: parts[1],
        );
      } else {
        return QonunSavol(qaysiModda: '', savol: '');
      }
    }).toList();
  }

  static List<String> _parseCsvLine(String line) {
    return line.split(',').map((e) => e.trim()).toList();
  }

  static String? topModda(String input) {
    if (_savollar.isEmpty) {
      throw Exception(
          "Qonun savollari yuklanmagan. Avval initialize() ni chaqiring.");
    }

    if (input.trim().isEmpty) return null;

    final result = _savollar.map((s) {
      final score = StringSimilarity.compareTwoStrings(
          s.savol.toLowerCase(), input.toLowerCase());
      return MapEntry(s, score);
    }).toList();

    result.sort((a, b) => b.value.compareTo(a.value));

    return result.isNotEmpty ? result.first.key.qaysiModda : null;
  }
}
