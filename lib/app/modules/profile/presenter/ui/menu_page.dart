import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:qrg/app/core/authentication_store.dart/authentication_store_impl.dart';
import 'package:qrg/app/modules/profile/controllers/profile_controller.dart';
import 'package:qrg/app/modules/profile/presenter/ui/profile_page.dart';
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
                children: [
                  Text(
                    'Para atualizar os dados de uma estação vá na lista principal e busque pelo indicativo. \n\nApenas o informante poderá atualizar as informações da estação.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Modular.to.pushNamed('/repeaters/add/');
                    },
                    child: ListTile(
                      leading: Icon(Icons.repeat, size: 35),
                      title: Text(
                        'Repetidoras',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Informe os dados de uma Repetidora'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.hub, size: 35),
                      title: Text(
                        'APRS',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Informe os dados de uma Estação APRS'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Modular.to.pushNamed('/ivgs/add/');
                    },
                    child: ListTile(
                      leading: Icon(Icons.cell_tower, size: 35),
                      title: Text(
                        'IVG',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          Text('Informe os dados de uma Estação Echolink'),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Modular.to.pushNamed('/repeaters/');
                    },
                    child: ListTile(
                      leading: Icon(Icons.menu, size: 35),
                      title: Text(
                        'Lista de Repetidoras',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Ir para a página principal'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _auth.logout();
                      Modular.to.pushNamed('/repeaters/');
                    },
                    child: ListTile(
                      leading: Icon(Icons.exit_to_app, size: 35),
                      title: Text(
                        'Sair',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Sair da área restrita'),
                    ),
                  ),
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
