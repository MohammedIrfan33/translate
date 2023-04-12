import 'package:language_code/language_code.dart';

String getLanguageName(String languageCode)  {

  final langugeName =  LanguageCodes.fromCode(languageCode).name;

  return langugeName;
}


