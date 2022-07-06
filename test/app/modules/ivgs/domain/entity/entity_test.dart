import 'package:flutter_test/flutter_test.dart';
import 'package:qrg/app/core/validators/validators.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';

void main() {
  //testar o minimo e maximo da string do indicativo
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

  test('CallSign Should\'t be an Empty String!', () {
    IvgEntity _ivg = IvgEntity(
      id: 'id',
      callSign: 'PY5TH',
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

    expect(_ivg.callSign, isNotEmpty);
  });

  test('City Should\'t be an Empty String!', () {
    IvgEntity _ivg = IvgEntity(
      id: 'id',
      callSign: 'PY5TH',
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

    expect(_ivg.city, isNotEmpty);
  });

  test('State Should\'t be an Empty String!', () {
    IvgEntity _ivg = IvgEntity(
      id: 'id',
      callSign: 'PY5TH',
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

    expect(_ivg.state, isNotEmpty);
  });

  test('Country Should\'t be an Empty String!', () {
    IvgEntity _ivg = IvgEntity(
      id: 'id',
      callSign: 'PY5TH',
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

    expect(_ivg.country, isNotEmpty);
  });

  test('GRID Should be in a \'XX11XX\' Format!', () {
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

  test('Frequency Should be in a \'145.030\' Format!', () {
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

  test('Tone Should\'t be an Empty String!', () {
    IvgEntity _ivg = IvgEntity(
      id: 'id',
      callSign: 'PY5TH',
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

    expect(_ivg.tone, isNotEmpty);
  });

  test('Coverage Should\'t be an Empty String!', () {
    IvgEntity _ivg = IvgEntity(
      id: 'id',
      callSign: 'PY5TH',
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

    expect(_ivg.coverage, isNotEmpty);
  });

  test('Protocol Should\'t be an Empty String!', () {
    IvgEntity _ivg = IvgEntity(
      id: 'id',
      callSign: 'PY5TH',
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

    expect(_ivg.protocol, isNotEmpty);
  });

  test('Active Should\'t be not Null!', () {
    IvgEntity _ivg = IvgEntity(
      id: 'id',
      callSign: 'PY5TH',
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

    bool expected = true;

    expect(_ivg.active, expected);
  });

  test('Operation Should\'t be not Null!', () {
    IvgEntity _ivg = IvgEntity(
      id: 'id',
      callSign: 'PY5TH',
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

    bool expected = false;

    expect(_ivg.operation, expected);
  });
}


//listas
//zero, nula, um ou vazia; o que faz?
//ver se extrapola os caracteres;
//testar a função do regex
//caracteres especiais ou acentos
//espaço em branco
//colocar o emoji?
//é maquina ou é gente?
//range de itens ou números;