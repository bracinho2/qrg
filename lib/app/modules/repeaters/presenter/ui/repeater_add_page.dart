import 'package:flutter/material.dart';
import 'package:qrg/app/core/radio_info/coverages.dart';
import 'package:qrg/app/core/radio_info/protocols.dart';
import 'package:qrg/app/core/radio_info/tones.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/presenter/controllers/repeater_store.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_add_page_widgets/button_widget.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_add_page_widgets/drop_down_widget.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_add_page_widgets/input_text_widget.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_page_widgets/app_bar_widget.dart';

class RepeaterAddPage extends StatefulWidget {
  final RepeaterEntity? repeaterEntity;
  final RepeaterStore repeaterStore;
  const RepeaterAddPage({
    Key? key,
    this.repeaterEntity,
    required this.repeaterStore,
  }) : super(key: key);

  @override
  State<RepeaterAddPage> createState() => _RepeaterAddPageState();
}

//final args = Modular.args.data;

class _RepeaterAddPageState extends State<RepeaterAddPage> {
  @override
  void initState() {
    super.initState();
    if (widget.repeaterEntity != null) {
      id = widget.repeaterEntity!.id;
      _callSignController.text = widget.repeaterEntity!.callSign;
      _gridController.text = widget.repeaterEntity!.grid;
      protocol = widget.repeaterEntity!.protocol;
      tone = widget.repeaterEntity!.tone;
      coverage = widget.repeaterEntity!.coverage;
      _txController.text = widget.repeaterEntity!.tx;
      _rxController.text = widget.repeaterEntity!.rx;
      _cityController.text = widget.repeaterEntity!.city;
      _stateController.text = widget.repeaterEntity!.state;
      _countryController.text = widget.repeaterEntity!.country;
      _informedByController.text = widget.repeaterEntity!.informedBy;

      operation = widget.repeaterEntity!.operation;
      active = widget.repeaterEntity!.active;

      button = 'Atualizar';
    } else {
      operation = true;
      active = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _callSignController = TextEditingController();
  final _gridController = TextEditingController();
  final _txController = TextEditingController();
  final _rxController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();
  final _informedByController = TextEditingController();

  String? id;
  String? tone;
  String? coverage;
  String? protocol;
  bool? active;
  bool? operation;
  bool isEnabled = true;
  String button = 'Informar';

  @override
  Widget build(BuildContext context) {
    void visible() {
      setState(() {
        if (protocol == 'FM') {
          isEnabled = true;
        } else {
          isEnabled = false;
        }
      });
    }

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
                            controller: _rxController, label: 'RX'))
                  ],
                ),
                Row(
                  children: [
                    DropDownWidget(
                      label: 'Protocolo',
                      tones: protocols,
                      value: protocol,
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
                        value: tone,
                        onChanged: (value) {
                          tone = value;
                        },
                      ),
                    ),
                    DropDownWidget(
                      label: 'Cobertura',
                      tones: coverages,
                      value: coverage,
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
                        value: active!,
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
                        value: operation!,
                        onChanged: (value) {
                          setState(() {
                            operation = value;
                          });
                        }),
                  ],
                ),
                AddRepeaterButtonWidget(
                  label: button,
                  onPressed: () {
                    widget.repeaterStore.send(
                      id: id,
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
                      active: active!,
                      operation: operation!,
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
