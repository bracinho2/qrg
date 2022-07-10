import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:qrg/app/core/authentication_store.dart/authentication_store_impl.dart';
import 'package:qrg/app/modules/profile/controllers/profile_controller.dart';
import 'package:qrg/app/modules/profile/presenter/ui/profile_page.dart';
import 'package:qrg/app/modules/profile/presenter/ui/widgets/menu_item.dart';
import 'package:qrg/app/modules/profile/presenter/widgets/app_bar_profile_widget.dart';

class ProfilePage extends StatefulWidget {
  final ProfileStore store;
  const ProfilePage({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int indexBottomNavigatorBar = 0;

  final _auth = Modular.get<AuthenticationImpl>();

  @override
  Widget build(BuildContext context) {
    String callSign = '';

    final user = _auth.loggedUser;
    if (user != null) {
      callSign = user.name;
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBarProfileWidget(
          title: callSign,
          subTitle: 'Hola que tal!',
        ),
        body: PageView(
          controller: _pageController,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: ListView(
                children: const [
                  Text(
                    'Para atualizar os dados de uma estação vá na lista principal e busque pelo indicativo. \n\nApenas o informante poderá atualizar as informações da estação.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MenuItem(
                      title: 'Repetidoras',
                      subtitle: 'Informe os dados de uma repetidora',
                      icon: Icons.repeat,
                      route: '/repeaters/add/'),
                  MenuItem(
                      title: 'IVG',
                      subtitle: 'Informe os dados de uma Estação IVG',
                      icon: Icons.cell_tower,
                      route: '/ivgs/add/'),
                  SizedBox(
                    height: 40,
                  ),
                  MenuItem(
                      title: 'Voltar',
                      subtitle: 'Ir para a página principal',
                      icon: Icons.menu,
                      route: '/home/'),
                  MenuItem(
                      title: 'Sair',
                      subtitle: 'Sair da área restrita',
                      icon: Icons.exit_to_app,
                      route: '/home/'),
                ],
              ),
            ),
            ProfileUserPage(
              store: widget.store,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottomNavigatorBar,
          onTap: (int page) {
            setState(() {
              indexBottomNavigatorBar = page;
              _pageController.animateToPage(
                page,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Cadastro'),
          ],
        ),
      ),
    );
  }
}
