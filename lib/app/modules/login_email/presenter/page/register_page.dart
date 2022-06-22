import 'package:flutter/material.dart';
import 'package:qrg/app/modules/login_email/presenter/page/widgets/login_button_widget.dart';
import 'package:qrg/app/modules/login_email/presenter/page/widgets/login_input_text_widget.dart';
import 'package:qrg/app/modules/login_email/presenter/store/login_store_controller.dart';

class RegisterPage extends StatefulWidget {
  final LoginStore loginStore;
  const RegisterPage({
    Key? key,
    required this.loginStore,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _callSignController = TextEditingController();
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
              LoginInputTextWidget(
                label: 'Indicativo',
                controller: _callSignController,
                //validator: ValidatorHelper.validaString,
                obscureText: false,
                enabled: true,
                minLines: 1,
                maxLines: 1,
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
                label: 'Registrar',
                onPressed: () {
                  widget.loginStore.signIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                    userName: _callSignController.text,
                  );

                  //_emailController.clear();
                  //_passwordController.clear();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
