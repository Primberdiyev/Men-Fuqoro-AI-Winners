import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:men_fuqoro_ai/features/utils/app_texts.dart';

Future<Map<String, dynamic>?> fetchQonun(String savol) async {
  final url = Uri.parse(AppTexts.apiKey);

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"savol": savol}),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    return null;
  }
}
