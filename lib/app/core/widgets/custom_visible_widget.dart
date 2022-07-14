import 'package:flutter/material.dart';

class VisibilidadePersonalizada extends StatelessWidget {
  final String chave;
  final Widget filho;
  final bool valorPadrao;
  const VisibilidadePersonalizada({
    Key? key,
    required this.chave,
    required this.filho,
    required this.valorPadrao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: MinhaClasseQueMostraWidgets()
          .recuperaUmaInformacao(chave: chave, valorPadrao: valorPadrao),
      child: filho,
    );
  }
}

class MinhaClasseQueMostraWidgets {
  bool recuperaUmaInformacao({
    required String chave,
    required bool valorPadrao,
  }) {
    // Aqui procuramos em algum lugar: cache, sharedPreferences, Firebase...
    //  _resultado = ProcuroEmAlgumLugar(chave);
    //  Verifico o Resultado:
    //  return _resultado != valorPadrao ? _resultado : valorPadrao;
    // Exemplo:
    var _resultado = true; //valor ficticio;
    return _resultado != valorPadrao ? _resultado : valorPadrao;
  }
}
