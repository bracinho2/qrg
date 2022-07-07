import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/core/authentication_store.dart/authentication_store_impl.dart';

class LoginIconButton extends StatelessWidget {
  const LoginIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = Modular.get<AuthenticationImpl>();
    return InkWell(
      onTap: () {
        if (_auth.loggedUser != null) {
          Modular.to.pushNamed('/profile/');
        } else {
          Modular.to.pushNamed('/login/');
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _auth.loggedUser != null
              ? Icon(Icons.menu, color: Colors.white)
              : Icon(Icons.login, color: Colors.white),
          _auth.loggedUser != null
              ? Text(
                  'Menu',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              : Text(
                  'Informar',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
        ],
      ),
    );
  }
}
