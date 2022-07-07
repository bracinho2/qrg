import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';

class RepeaterEntityMapper extends RepeaterEntity {
  RepeaterEntityMapper({
    required String id,
    required String callSign,
    required String city,
    required String state,
    required String country,
    required String grid,
    required String tx,
    required String rx,
    required String tone,
    required String coverage,
    required String protocol,
    required String informedBy,
    required bool active,
    required bool operation,
  }) : super(
          id: id,
          callSign: callSign,
          city: city,
          state: state,
          country: country,
          grid: grid,
          tx: tx,
          rx: rx,
          tone: tone,
          coverage: coverage,
          protocol: protocol,
          informedBy: informedBy,
          active: active,
          operation: operation,
        );

  static Map<String, dynamic> toMap(RepeaterEntity repeaterEntity) {
    return {
      'id': repeaterEntity.id,
      'callSign': repeaterEntity.callSign,
      'city': repeaterEntity.city,
      'state': repeaterEntity.state,
      'country': repeaterEntity.country,
      'grid': repeaterEntity.grid,
      'tx': repeaterEntity.tx,
      'rx': repeaterEntity.rx,
      'tone': repeaterEntity.tone,
      'coverage': repeaterEntity.coverage,
      'protocol': repeaterEntity.protocol,
      'informedBy': repeaterEntity.informedBy,
      'active': repeaterEntity.active.toString(),
      'operational': repeaterEntity.operation.toString(),
    };
  }

  factory RepeaterEntityMapper.fromMap(Map<String, dynamic> map) {
    return RepeaterEntityMapper(
      id: map['id'],
      callSign: map['callSign'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
      grid: map['grid'] ?? '',
      tx: map['tx'],
      rx: map['rx'],
      tone: map['tone'],
      coverage: map['coverage'],
      protocol: map['protocol'],
      informedBy: map['informedBy'],
      active: map['active'] != 'true' ? false : true,
      operation: map['operational'] != 'true' ? false : true,
    );
  }
}
