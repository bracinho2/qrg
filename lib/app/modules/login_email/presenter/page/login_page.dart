import 'package:flutter/material.dart';
import 'package:qrg/app/modules/login_email/presenter/page/widgets/login_button_widget.dart';
import 'package:qrg/app/modules/login_email/presenter/page/widgets/login_input_text_widget.dart';
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

  String _legenda = 'Informe seus dados:';

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
              Text(
                _legenda,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              LoginInputTextWidget(
                label: 'email',
                controller: _emailController,
                //validator: ValidatorHelper.validaString,
                obscureText: false,
                enabled: true,
                minLines: 1,
                maxLines: 1,
              ),
              LoginInputTextWidget(
                label: 'senha',
                controller: _passwordController,
                //validator: ValidatorHelper.validaString,
                obscureText: true,
                enabled: true,
                minLines: 1,
                maxLines: 1,
              ),
              LoginButtonWidget(
                label: 'Entrar',
                onPressed: () {
                  _legenda = 'Informe seus dados:';
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
                  setState(() {
                    _legenda = 'Informe seus dados para Cadastro:';
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
