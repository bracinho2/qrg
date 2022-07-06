import 'package:flutter_test/flutter_test.dart';
import 'package:qrg/app/core/validators/validators.dart';

void main() {
  test('Should validate Method to QRG > 145.030', () {
    expect(validateFrequency(value: '145.030'), true);
  });

  test('Should validate Method to QRG 27.030', () {
    expect(validateFrequency(value: '27.030'), true);
  });
}
