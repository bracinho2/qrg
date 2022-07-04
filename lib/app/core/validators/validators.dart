bool validateFrequency({required String value}) {
  final sentence = RegExp(r'^\d\d\d.\d\d\d');
  return sentence.hasMatch(value);
}
