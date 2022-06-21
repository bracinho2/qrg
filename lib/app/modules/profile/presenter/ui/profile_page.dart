import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/core/authentication_store.dart/authentication_store_impl.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarProfileWidget(
          title: 'QRG',
          subTitle: 'Hola que tal!',
        ),
        body: PageView(
          controller: _pageController,
          children: [
            Container(
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Modular.to.pushNamed('/repeaters/');
                    },
                    child: const Center(
                      child: Text('Repetidoras'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _auth.logout();
                      Modular.to.pushNamed('/repeaters/');
                    },
                    child: const Center(
                      child: Text('Logout'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blueAccent,
              child: const Center(
                child: Text('Cadastro'),
              ),
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
