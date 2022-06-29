import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/core/authentication_store.dart/authentication_store_impl.dart';
import 'package:qrg/app/modules/profile/presenter/ui/profile_page.dart';
import 'package:qrg/app/modules/profile/presenter/widgets/app_bar_profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
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
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Modular.to.pushNamed('/repeaters/add/');
                    },
                    child: ListTile(
                      leading: Icon(Icons.repeat, size: 45),
                      title: Text(
                        'Repetidoras',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Informe os dados de uma Estação'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.hub, size: 45),
                      title: Text(
                        'APRS',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Informe os dados de uma Estação APRS'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.cell_tower, size: 45),
                      title: Text(
                        'Echolink',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          Text('Informe os dados de uma Estação Echolink'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Modular.to.pushNamed('/repeaters/');
                    },
                    child: ListTile(
                      leading: Icon(Icons.menu, size: 45),
                      title: Text(
                        'Voltar ao Menu',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
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
                      leading: Icon(Icons.exit_to_app, size: 45),
                      title: Text(
                        'Sair',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Sair da área restrita'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _auth.currentUser();
                      //Modular.to.pushNamed('/repeaters/');
                    },
                    child: ListTile(
                      leading: Icon(Icons.exit_to_app, size: 45),
                      title: Text(
                        'Current User',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Current'),
                    ),
                  ),
                ],
              ),
            ),
            ProfileUserPage(),
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
