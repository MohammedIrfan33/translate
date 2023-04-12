class LanguageCodeModel {
  String? language;

  LanguageCodeModel({this.language});

  LanguageCodeModel.fromJson(Map<String, dynamic> json) {
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['language'] = language;
    return data;
  }

  
}