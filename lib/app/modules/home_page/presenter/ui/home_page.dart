import 'package:flutter/material.dart';

import 'package:qrg/app/core/widgets/app_bar_widget.dart';
import 'package:qrg/app/modules/ivgs/presenter/ivgs_store.dart';
import 'package:qrg/app/modules/ivgs/presenter/list_page/ivg_page.dart';
import 'package:qrg/app/modules/repeaters/presenter/controllers/repeater_store.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_page.dart';

class HomePage extends StatefulWidget {
  final RepeaterStore repeaterStore;
  final IvgStore ivgStore;
  const HomePage({
    Key? key,
    required this.repeaterStore,
    required this.ivgStore,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final PageController _pageController = PageController(initialPage: 1);
int indexBottomNavigatorBar = 1;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'QRG',
          subTitle: 'Hola que tal',
        ),
        body: PageView(
          controller: _pageController,
          children: [
            IvgPage(ivgStore: widget.ivgStore),
            RepeaterPage(repeaterStore: widget.repeaterStore),
            Container(
              color: Colors.blueAccent,
              child: const Center(
                child: Text('Em Breve =)'),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_input_antenna_rounded),
                label: 'IVGs'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_input_antenna_rounded),
                label: 'Repeaters'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_input_antenna_rounded),
                label: 'APRS'),
          ],
        ),
      ),
    );
  }
}
