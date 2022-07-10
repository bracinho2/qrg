import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/core/widgets/input_text_widget.dart';
import 'package:qrg/app/modules/login_email/presenter/page/widgets/login_button_widget.dart';
import 'package:qrg/app/modules/login_email/presenter/store/login_store_controller.dart';

class LoginPage extends StatefulWidget {
  final LoginStore loginStore;
  const LoginPage({
    Key? key,
    required this.loginStore,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 75,
                child: Image.asset('assets/images/qrg.png'),
              ),
              const SizedBox(
                height: 50,
              ),
              InputTextWidget(
                label: 'email',
                controller: _emailController,
                obscureText: false,
                icon: Icon(Icons.person),
              ),
              InputTextWidget(
                label: 'password',
                controller: _passwordController,
                obscureText: true,
                icon: Icon(Icons.password),
              ),
              LoginButtonWidget(
                label: 'Entrar',
                onPressed: () {
                  setState(() {});
                  widget.loginStore.checkLogin(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );

                  _emailController.clear();
                  _passwordController.clear();
                },
              ),
              LoginButtonWidget(
                label: 'Ainda não é cadastrado? Registre-se!',
                onPressed: () {
                  Modular.to.pushNamedAndRemoveUntil(
                      '/login/register/', (_) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
