import 'package:flutter/material.dart';
import 'package:qrg/app/core/radio_info/tones.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_add_page_widgets.dart/drop_down_widget.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_add_page_widgets.dart/input_text_widget.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_page_widgets/app_bar_widget.dart';

class RepeaterAddPage extends StatelessWidget {
  const RepeaterAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(
          title: 'Adicionar Repetidora',
          subTitle: 'teste',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 5,
              left: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const RepeaterAddInputTextWidget(
                  label: 'Indicativo',
                ),
                Row(
                  children: [
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        label: 'TX',
                      ),
                    ),
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        label: 'RX',
                      ),
                    ),
                    DropDownWidget(
                      label: 'Tone',
                      tones: tones,
                      //value: 'Two',
                      onChanged: (value) {},
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        label: 'TX',
                      ),
                    ),
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        label: 'RX',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        label: 'Cidade',
                      ),
                    ),
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        label: 'Estado',
                      ),
                    ),
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        label: 'País',
                      ),
                    ),
                  ],
                ),
                const RepeaterAddInputTextWidget(
                  label: 'teste',
                ),
                const RepeaterAddInputTextWidget(
                  label: 'teste',
                ),
                const RepeaterAddInputTextWidget(
                  label: 'teste',
                ),
                const RepeaterAddInputTextWidget(
                  label: 'teste',
                ),
                const RepeaterAddInputTextWidget(
                  label: 'teste',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
