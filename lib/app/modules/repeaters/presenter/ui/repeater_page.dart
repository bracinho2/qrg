import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/presenter/controllers/repeater_store.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/widgets/app_bar_widget.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/widgets/repeater_card_widget.dart';

class RepeaterPage extends StatefulWidget {
  final RepeaterStore repeaterStore;
  const RepeaterPage({
    Key? key,
    required this.repeaterStore,
  }) : super(key: key);

  @override
  State<RepeaterPage> createState() => _RepeaterPageState();
}

class _RepeaterPageState extends State<RepeaterPage> {
  final PageController _pageController = PageController(initialPage: 1);
  int indexBottomNavigatorBar = 1;

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(
          title: 'QRG',
          subTitle: 'Bons contatos!',
        ),
        body: PageView(
          controller: _pageController,
          children: [
            Container(
              color: Colors.amber,
              child: const Center(
                child: Text('Em Breve =)'),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          widget.repeaterStore.onChanged('');
                        },
                      ),
                      label: const Text('Procurar'),
                    ),
                    onChanged: widget.repeaterStore.onChanged,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ScopedBuilder.transition(
                    store: widget.repeaterStore,
                    transition: (_, child) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: child,
                      );
                    },
                    onLoading: (_) => const CircularProgressIndicator(),
                    onState: (context, List<RepeaterEntity> state) {
                      if (widget.repeaterStore.state.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        itemCount: state.length,
                        itemBuilder: ((context, index) =>
                            RepeaterCard(repeaterEntity: state[index])),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
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
                label: 'Echolink'),
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
