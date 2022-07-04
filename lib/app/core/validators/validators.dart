bool validateFrequency({required String value}) {
  final sentence = RegExp(r'^\d\d\d.\d\d\d');
  return sentence.hasMatch(value);
}

bool validateGrid({required String value}) {
  final sentence = RegExp(r'^[a-zA-Z][a-zA-Z]\d\d[a-zA-Z][a-zA-Z]$');
  return sentence.hasMatch(value);
}
