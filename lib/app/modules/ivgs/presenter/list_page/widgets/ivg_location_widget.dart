import 'package:flutter/material.dart';

class IvgLocation extends StatelessWidget {
  final String cidade;
  final String estado;
  final String pais;
  final String grid;
  final String abrangencia;
  final String informante;

  // ignore: use_key_in_widget_constructors
  const IvgLocation({
    required this.cidade,
    required this.estado,
    required this.pais,
    required this.grid,
    required this.abrangencia,
    required this.informante,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      //leading: const Icon(Icons.location_city_outlined),
      title: Text(
        cidade + ' - ' + estado + ' - ' + pais,
        style: const TextStyle(
          fontSize: 11,
        ),
      ),
      subtitle: Text(
        'Cobertura ' + abrangencia + ' | Informou ' + informante,
        style: const TextStyle(
          fontSize: 11,
        ),
      ),
      trailing: Text(
        grid,
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }
}
