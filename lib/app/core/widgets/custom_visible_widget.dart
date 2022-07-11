import 'package:flutter/material.dart';

class VisibilidadePersonalizada extends StatelessWidget {
  //este widget receberá via construtor;
  final Widget child;
  //o valor padrão será enviado via construtor;
  final bool active;
  const VisibilidadePersonalizada({
    Key? key,
    required this.child,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: active,
      child: child,
    );
  }
}
