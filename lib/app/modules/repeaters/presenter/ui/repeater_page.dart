import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/presenter/controllers/repeater_store.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_page_widgets/repeater_card_widget.dart';

class RepeaterPage extends StatefulWidget {
  final RepeaterStore repeaterStore;
  const RepeaterPage({
    Key? key,
    required this.repeaterStore,
  }) : super(key: key);

  @override
  State<RepeaterPage> createState() => _RepeaterPageState();
}

TextEditingController _searchController = TextEditingController();

class _RepeaterPageState extends State<RepeaterPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.repeaterStore.fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            onState: (_, List<RepeaterEntity> state) {
              // if (widget.repeaterStore.state.isEmpty) {
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );
              // }
              return ListView.builder(
                itemCount: state.length,
                itemBuilder: ((_, index) =>
                    RepeaterCard(repeaterEntity: state[index])),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
