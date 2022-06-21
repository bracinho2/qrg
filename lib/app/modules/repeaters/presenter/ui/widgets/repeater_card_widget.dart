import 'package:flutter/material.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/widgets/repeater_detail_widget.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/widgets/repeater_location_widget.dart';

class RepeaterCard extends StatefulWidget {
  final RepeaterEntity repeaterEntity;

  const RepeaterCard({
    Key? key,
    required this.repeaterEntity,
  }) : super(key: key);
  @override
  _RepeaterCardState createState() => _RepeaterCardState();
}

class _RepeaterCardState extends State<RepeaterCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const SizedBox(height: 1),
            RepeaterDetail(
              avatar: 'assets/images/station_avatar.jpeg',
              indicativo: widget.repeaterEntity.callSign,
              modo: widget.repeaterEntity.protocol,
              tx: widget.repeaterEntity.tx,
              rx: widget.repeaterEntity.rx,
              tom: widget.repeaterEntity.tone,
            ),
            const SizedBox(height: 1),
            RepeaterLocation(
              cidade: widget.repeaterEntity.city,
              estado: widget.repeaterEntity.state,
              pais: widget.repeaterEntity.country,
              abrangencia: widget.repeaterEntity.coverage,
              grid: widget.repeaterEntity.grid,
              informante: widget.repeaterEntity.informedBy,
            ),
          ],
        ),
      ),
    );
  }
}
