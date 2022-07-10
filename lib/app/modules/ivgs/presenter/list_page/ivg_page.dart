import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';
import 'package:qrg/app/modules/ivgs/presenter/ivgs_store.dart';
import 'package:qrg/app/modules/ivgs/presenter/list_page/widgets/ivg_card_widget.dart';

class IvgPage extends StatefulWidget {
  final IvgStore ivgStore;
  const IvgPage({
    Key? key,
    required this.ivgStore,
  }) : super(key: key);

  @override
  State<IvgPage> createState() => _IvgPageState();
}

TextEditingController _searchController = TextEditingController();

class _IvgPageState extends State<IvgPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.ivgStore.fetch();
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
                  widget.ivgStore.onChanged('');
                },
              ),
              label: const Text('Procurar'),
            ),
            onChanged: widget.ivgStore.onChanged,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ScopedBuilder.transition(
            store: widget.ivgStore,
            transition: (_, child) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: child,
              );
            },
            onLoading: (_) => const CircularProgressIndicator(),
            onState: (_, List<IvgEntity> state) {
              return ListView.builder(
                itemCount: state.length,
                itemBuilder: ((_, index) => IvgCard(ivgEntity: state[index])),
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
