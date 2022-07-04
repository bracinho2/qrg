import 'package:flutter_test/flutter_test.dart';
import 'package:qrg/app/core/validators/validators.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';

void main() {
  test('Entity Should\'t be null!', () {
    IvgEntity _ivg = IvgEntity(
      id: 'id',
      callSign: 'callSign',
      city: 'city',
      state: 'province',
      country: 'country',
      grid: 'grid',
      qrg: 'tx',
      tone: 'tone',
      coverage: 'coverage',
      protocol: 'protocol',
      informedBy: 'informedBy',
      active: true,
      operation: false,
    );

    expect(_ivg, isNotNull);
  });

  test('Frquency Should be in a \'145.030\' Format!', () {
    IvgEntity _ivg = IvgEntity(
      id: 'id',
      callSign: 'callSign',
      city: 'city',
      state: 'province',
      country: 'country',
      grid: 'grid',
      qrg: '145.030',
      tone: 'tone',
      coverage: 'coverage',
      protocol: 'protocol',
      informedBy: 'informedBy',
      active: true,
      operation: false,
    );

    expect(validateFrequency(value: _ivg.qrg), true);
  });

  test('Frquency Should be in a \'XX11XX\' Format!', () {
    IvgEntity _ivg = IvgEntity(
      id: 'id',
      callSign: 'callSign',
      city: 'city',
      state: 'province',
      country: 'country',
      grid: 'GG33XD',
      qrg: '145.030',
      tone: 'tone',
      coverage: 'coverage',
      protocol: 'protocol',
      informedBy: 'informedBy',
      active: true,
      operation: false,
    );

    expect(validateGrid(value: _ivg.grid), true);
  });
}
