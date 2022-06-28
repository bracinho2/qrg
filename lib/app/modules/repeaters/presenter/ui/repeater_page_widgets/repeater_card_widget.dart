import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_page_widgets/repeater_detail_widget.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_page_widgets/repeater_location_widget.dart';

class RepeaterCard extends StatelessWidget {
  final RepeaterEntity repeaterEntity;
  const RepeaterCard({
    Key? key,
    required this.repeaterEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: InkWell(
        onTap: () async {
          await Modular.to
              .pushNamed('/repeaters/add/', arguments: repeaterEntity);
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              const SizedBox(height: 1),
              RepeaterDetail(
                avatar: 'assets/images/station_avatar.jpeg',
                indicativo: repeaterEntity.callSign,
                modo: repeaterEntity.protocol,
                tx: repeaterEntity.tx,
                rx: repeaterEntity.rx,
                tom: repeaterEntity.tone,
              ),
              const SizedBox(height: 1),
              RepeaterLocation(
                cidade: repeaterEntity.city,
                estado: repeaterEntity.state,
                pais: repeaterEntity.country,
                abrangencia: repeaterEntity.coverage,
                grid: repeaterEntity.grid,
                informante: repeaterEntity.informedBy,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
