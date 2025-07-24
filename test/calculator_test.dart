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

  // Step 3: Add two numbers separated by a comma.
  test('adds two numbers separated by a comma', () {
    final calculator = StringCalculator();
    expect(calculator.add('1,2'), 3);
  });

  // Step 4: Add any number of comma-separated values.
  test('adds multiple numbers separated by commas', () {
    final calculator = StringCalculator();
    expect(calculator.add('1,2,3,4'), 10);
  });

  // Step 5: Allow newline character as an additional delimiter along with commas.
  test('supports newline as a delimiter', () {
    final calculator = StringCalculator();
    expect(calculator.add('1\n2,3'), 6);
  });

  // Step 6: If a custom delimiter is defined, use it to split the numbers.
  test('supports custom delimiter using //;\n format', () {
    final calculator = StringCalculator();
    expect(calculator.add('//;\n1;2'), 3);
  });

  // Step 7: Throw an exception when the input contains negative numbers.
  test('throws an exception for negative numbers', () {
    final calculator = StringCalculator();
    expect(
      () => calculator.add('1,-2,-4'),
      throwsA(
        predicate((e) =>
            e is Exception &&
            e.toString().contains('negative numbers not allowed: -2,-4')),
      ),
    );
  });
} 