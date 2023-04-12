import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:translate/models/language_code_model.dart';

import '../utils/constants/api_constants.dart';

Future<List<LanguageCodeModel>> getLanguages() async {
  Uri uri = Uri.parse('$baseUrl/languages');

  final response = await http.get(
    uri,
    headers: {
      'Accept-Encoding': 'application/gzip',
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
    },
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['data']['languages']
        .map<LanguageCodeModel>((e) => LanguageCodeModel.fromJson(e))
        .toList();
  } else {
    throw Exception('Failed to load');
  }
}



// the translate api not working
Future<void> translate(String q,String target) async{
  Uri uri = Uri.parse(baseUrl);
  final response = await http.post(
    uri,
    headers: <String, String>{
      'content-type': 'application/x-www-form-urlencoded',
      'Accept-Encoding': 'application/gzip',
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
    },
    body: jsonEncode(<String, String>{
      'q':   q,
      'target': target,
    }),
  );

  print(response.body);
}
