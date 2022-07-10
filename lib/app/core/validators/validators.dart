bool validateFrequency({required String value}) {
  if (value.length == 6) {
    final sentence = RegExp(r'^\d\d.\d\d\d$');
    return sentence.hasMatch(value);
  } else {
    final sentence = RegExp(r'^\d\d\d.\d\d\d$', dotAll: true);
    return sentence.hasMatch(value);
  }
}

bool validateGrid({required String value}) {
  final sentence = RegExp(r'^[a-zA-Z][a-zA-Z]\d\d[a-zA-Z][a-zA-Z]$');
  return sentence.hasMatch(value);
}


//validar o tamanho minimo e maximo do indicativo

//validar o tamanho da string da qrg;