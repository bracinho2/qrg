import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/core/authentication_store.dart/authentication_store_impl.dart';
import 'package:qrg/app/modules/login_email/user_params.dart';
import 'package:qrg/app/modules/profile/controllers/profile_controller.dart';
import 'package:qrg/app/modules/profile/presenter/ui/widgets/profile_button_widget.dart';
import 'package:qrg/app/modules/profile/presenter/ui/widgets/profile_input_text_widget.dart';

class ProfileUserPage extends StatefulWidget {
  final ProfileStore store;
  const ProfileUserPage({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

final _auth = Modular.get<AuthenticationImpl>();

final _callSignController = TextEditingController();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

class _ProfileUserPageState extends State<ProfileUserPage> {
  @override
  Widget build(BuildContext context) {
    final user = _auth.loggedUser;
    if (user != null) {
      _callSignController.text = user.name;
      _emailController.text = user.email;
      //_phoneController.text = user.phone;
      //_passwordController.text = user.password;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileInputTextWidget(
          controller: _callSignController,
          label: 'Indicativo',
          icon: Icon(Icons.badge),
        ),
        ProfileInputTextWidget(
          controller: _emailController,
          label: 'Email',
          icon: Icon(Icons.email),
        ),
        // ProfileInputTextWidget(
        //   controller: _phoneController,
        //   label: 'Telefone',
        //   icon: Icon(Icons.phone),
        // ),
        ProfileInputTextWidget(
          controller: _passwordController,
          label: 'Senha',
          obscureText: true,
          icon: Icon(Icons.password),
        ),
        ProfileButtonWidget(
          label: 'Atualizar',
          onPressed: () {
            final info = UserParams(
              email: _emailController.text,
              phone: '',
              userName: _callSignController.text.toUpperCase(),
              password: _passwordController.text,
            );

            widget.store.updateUserParams(info);
            _passwordController.clear();
          },
        ),
      ],
    );
  }
}
