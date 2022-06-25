import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/core/radio_info/coverages.dart';
import 'package:qrg/app/core/radio_info/protocols.dart';
import 'package:qrg/app/core/radio_info/tones.dart';
import 'package:qrg/app/modules/repeaters/presenter/controllers/repeater_store.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_add_page_widgets.dart/button_widget.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_add_page_widgets.dart/drop_down_widget.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_add_page_widgets.dart/input_text_widget.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_page_widgets/app_bar_widget.dart';

class RepeaterAddPage extends StatefulWidget {
  final RepeaterStore repeaterStore;
  const RepeaterAddPage({
    Key? key,
    required this.repeaterStore,
  }) : super(key: key);

  @override
  State<RepeaterAddPage> createState() => _RepeaterAddPageState();
}

final _callSignController = TextEditingController();
final _gridController = TextEditingController();
final _txController = TextEditingController();
final _rxController = TextEditingController();
final _cityController = TextEditingController();
final _stateController = TextEditingController();
final _countryController = TextEditingController();
final _informedByController = TextEditingController();

final arg = Modular.args.data;

String? id;
String? city;
String? state;
String? country;
String? grid;
String? tx;
String? rx;
String? tone;
String? coverage;
String? protocol;
String? informedBy;
bool active = true;
bool operation = true;

bool isEnabled = false;

class _RepeaterAddPageState extends State<RepeaterAddPage> {
  void visible() {
    setState(() {
      if (protocol == 'FM') {
        isEnabled = true;
      } else {
        isEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(
          title: 'Repetidora',
          subTitle: 'Informe os dados',
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
                Row(
                  children: [
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        controller: _callSignController,
                        label: 'Indicativo',
                      ),
                    ),
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        controller: _gridController,
                        label: 'Grid',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        controller: _txController,
                        label: 'TX',
                      ),
                    ),
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        controller: _rxController,
                        label: 'RX',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    DropDownWidget(
                      label: 'Modo',
                      tones: protocols,
                      //value: 'Two',
                      onChanged: (value) {
                        protocol = value;
                        visible();
                      },
                    ),
                    Visibility(
                      visible: isEnabled,
                      child: DropDownWidget(
                        label: 'Subtom',
                        tones: tones,
                        //value: 'Two',
                        onChanged: (value) {
                          tone = value;
                        },
                      ),
                    ),
                    DropDownWidget(
                      label: 'Cobertura',
                      tones: coverages,
                      //value: 'Two',
                      onChanged: (value) {
                        coverage = value;
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        controller: _cityController,
                        label: 'Cidade',
                      ),
                    ),
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        controller: _stateController,
                        label: 'Estado',
                      ),
                    ),
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        controller: _countryController,
                        label: 'País',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RepeaterAddInputTextWidget(
                        controller: _informedByController,
                        label: 'Informante',
                      ),
                    ),
                    Text('Está Instalada?'),
                    Switch(
                        value: active,
                        onChanged: (value) {
                          setState(() {
                            active = value;
                            if (!value) {
                              operation = false;
                            }
                          });
                        }),
                    Text('Opera?'),
                    Switch(
                        value: operation,
                        onChanged: (value) {
                          setState(() {
                            operation = value;
                          });
                        }),
                  ],
                ),
                AddRepeaterButtonWidget(
                  label: 'Informar',
                  onPressed: () {
                    widget.repeaterStore.addRepeater(
                      id: id ?? '',
                      callSign: _callSignController.text.toUpperCase(),
                      grid: _gridController.text.toUpperCase(),
                      city: _cityController.text.toUpperCase(),
                      state: _stateController.text.toUpperCase(),
                      country: _countryController.text.toUpperCase(),
                      tx: _txController.text,
                      rx: _rxController.text,
                      tone: tone ?? '',
                      coverage: coverage ?? '',
                      protocol: protocol ?? '',
                      informedBy: _informedByController.text.toUpperCase(),
                      active: active,
                      operation: operation,
                    );
                    _callSignController.clear();
                    _gridController.clear();
                    _txController.clear();
                    _rxController.clear();
                    _cityController.clear();
                    _stateController.clear();
                    _countryController.clear();
                    _informedByController.clear();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
