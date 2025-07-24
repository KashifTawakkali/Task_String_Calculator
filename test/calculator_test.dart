import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/calculator.dart';

void main() {
  // Step 1: An empty input string should return 0 as there are no numbers to add.
  test('returns 0 for empty input', () {
    final calculator = StringCalculator();
    expect(calculator.add(''), 0);
  });
  // Step 2: If there's only one number in the string, return that number.
  test('returns the number itself for a single number input', () {
    final calculator = StringCalculator();
    expect(calculator.add('5'), 5);
  });
} 