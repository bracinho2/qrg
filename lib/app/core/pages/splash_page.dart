import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key) {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Modular.to.pushNamedAndRemoveUntil('/repeaters/', (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 75,
              child: Image.asset('assets/images/qrg.png'),
            ),
          ),
        ],
      ),
    );
  }
}
