import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:men_fuqoro_ai/features/utils/api_keys.dart';

class GeminiProvider extends ChangeNotifier {
  late GenerativeModel generativeModel;
  late ChatSession _chatSession;

  initGemini() {
    generativeModel =
        GenerativeModel(model: 'gemini-pro', apiKey: ApiKeys.geminiApi);
    _chatSession = generativeModel.startChat();
  }
}
