import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String route;
  const MenuItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed(route);
      },
      child: ListTile(
        leading: Icon(icon, size: 35),
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
