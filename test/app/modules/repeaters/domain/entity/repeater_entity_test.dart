import 'package:flutter_test/flutter_test.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';

void main() {
  test('Should\'t be null', () {
    RepeaterEntity _repeater = RepeaterEntity(
      id: 'id',
      callSign: 'callSign',
      city: 'city',
      state: 'province',
      country: 'country',
      grid: 'grid',
      tx: 'tx',
      rx: 'rx',
      tone: 'tone',
      coverage: 'coverage',
      protocol: 'protocol',
      informedBy: 'informedBy',
      active: true,
      operation: false,
    );

    expect(_repeater, isNotNull);
  });
}
