class MyData {
  static List<Map<String, Object>> dummyList = List.generate(40, (index) {
    return {
      "id": index,
      "title": "רכב מספר $index",
      "subtitle": "פרוט לרכב מספר $index",
      "isFavorite": "false"
    };
  });

  static List users = [];
  static List items = [];
}

extension BoolParsing on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}
