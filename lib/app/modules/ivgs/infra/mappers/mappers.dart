import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';

class IvgEntityMapper extends IvgEntity {
  IvgEntityMapper({
    required String id,
    required String callSign,
    required String city,
    required String state,
    required String country,
    required String grid,
    required String qrg,
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
          qrg: qrg,
          tone: tone,
          coverage: coverage,
          protocol: protocol,
          informedBy: informedBy,
          active: active,
          operation: operation,
        );

  static Map<String, dynamic> toMap(IvgEntity repeaterEntity) {
    return {
      'id': repeaterEntity.id,
      'callSign': repeaterEntity.callSign,
      'city': repeaterEntity.city,
      'state': repeaterEntity.state,
      'country': repeaterEntity.country,
      'grid': repeaterEntity.grid,
      'qrg': repeaterEntity.qrg,
      'tone': repeaterEntity.tone,
      'coverage': repeaterEntity.coverage,
      'protocol': repeaterEntity.protocol,
      'informedBy': repeaterEntity.informedBy,
      'active': repeaterEntity.active.toString(),
      'operational': repeaterEntity.operation.toString(),
    };
  }

  factory IvgEntityMapper.fromMap(Map<String, dynamic> map) {
    return IvgEntityMapper(
      id: map['id'],
      callSign: map['callSign'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
      grid: map['grid'],
      qrg: map['qrg'],
      tone: map['tone'],
      coverage: map['coverage'],
      protocol: map['protocol'],
      informedBy: map['informedBy'],
      active: map['active'] != 'true' ? false : true,
      operation: map['operational'] != 'true' ? false : true,
    );
  }
}
