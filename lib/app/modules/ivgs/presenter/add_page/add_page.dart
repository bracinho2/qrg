import 'package:flutter/material.dart';
import 'package:qrg/app/core/radio_info/coverages.dart';
import 'package:qrg/app/core/radio_info/protocols.dart';
import 'package:qrg/app/core/radio_info/tones.dart';
import 'package:qrg/app/core/widgets/input_text_widget.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';
import 'package:qrg/app/modules/ivgs/presenter/ivgs_store.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_add_page_widgets/button_widget.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_add_page_widgets/drop_down_widget.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_add_page_widgets/input_text_widget.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_page_widgets/app_bar_widget.dart';

class IvgAddPage extends StatefulWidget {
  final IvgEntity? entity;
  final IvgStore store;
  const IvgAddPage({
    Key? key,
    this.entity,
    required this.store,
  }) : super(key: key);

  @override
  State<IvgAddPage> createState() => _IvgAddPageState();
}

//final args = Modular.args.data;

class _IvgAddPageState extends State<IvgAddPage> {
  final _callSignController = TextEditingController();
  final _gridController = TextEditingController();
  final _qrgController = TextEditingController();
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
  void initState() {
    super.initState();
    if (widget.entity != null) {
      id = widget.entity!.id;
      _callSignController.text = widget.entity!.callSign;
      _gridController.text = widget.entity!.grid;
      protocol = widget.entity!.protocol;
      tone = widget.entity!.tone;
      coverage = widget.entity!.coverage;
      _qrgController.text = widget.entity!.qrg;
      _cityController.text = widget.entity!.city;
      _stateController.text = widget.entity!.state;
      _countryController.text = widget.entity!.country;
      _informedByController.text = widget.entity!.informedBy;

      operation = widget.entity!.operation;
      active = widget.entity!.active;

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
          title: 'Internet Voice Gateway',
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
                      child: InputTextWidget(
                        controller: _callSignController,
                        label: 'Indicativo',
                        icon: Icon(Icons.email),
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
                      child: InputTextWidget(
                        controller: _qrgController,
                        label: 'QRG',
                        icon: Icon(Icons.email),
                      ),
                    ),
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
                      child: InputTextWidget(
                        controller: _cityController,
                        label: 'Cidade',
                        icon: Icon(Icons.email),
                      ),
                    ),
                    Expanded(
                      child: InputTextWidget(
                        controller: _stateController,
                        label: 'Estado',
                        icon: Icon(Icons.email),
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
                      child: InputTextWidget(
                        controller: _informedByController,
                        label: 'Informante',
                        icon: Icon(Icons.email),
                      ),
                    ),
                    Text('Está Instalado?'),
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
                    widget.store.send(
                      id: id,
                      callSign: _callSignController.text.toUpperCase(),
                      grid: _gridController.text.toUpperCase(),
                      city: _cityController.text.toUpperCase(),
                      state: _stateController.text.toUpperCase(),
                      country: _countryController.text.toUpperCase(),
                      qrg: _qrgController.text,
                      tone: tone ?? 'No Tone',
                      coverage: coverage ?? 'Local',
                      protocol: protocol ?? 'FM',
                      informedBy: _informedByController.text.toUpperCase(),
                      active: active!,
                      operation: operation!,
                    );
                    // _callSignController.clear();
                    // _gridController.clear();
                    // _qrgController.clear();
                    // _cityController.clear();
                    // _stateController.clear();
                    // _countryController.clear();
                    // _informedByController.clear();
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
