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

  // Step 8: Numbers greater than 1000 should be ignored in the sum.
  test('ignores numbers greater than 1000', () {
    final calculator = StringCalculator();
    expect(calculator.add('2,1001,6'), 8);
  });

  // Step 9: Support multiple or multi-character delimiters using //[delim] format
  test('supports multi-character delimiters in //[delim] format', () {
    final calculator = StringCalculator();
    expect(calculator.add('//[***]\n1***2***3'), 6);
  });

  // Step 10: supports multiple delimiters in //[delim1][delim2] format
  test('supports multiple delimiters in //[delim1][delim2] format', () {
    final calculator = StringCalculator();
    expect(calculator.add('//[*][%]\n1*2%3'), 6);
  });

  // Step 11: supports multiple multi-character delimiters
  test('supports multiple multi-character delimiters', () {
    final calculator = StringCalculator();
    expect(calculator.add('//[##][--]\n1##2--3'), 6);
  });

  // Step 12: Support empty brackets as delimiters (edge case).
  test('treats empty brackets as invalid delimiter and throws error', () {
    final calculator = StringCalculator();
    expect(() => calculator.add('//[]\n1'), throwsException);
  });

  // Step 13: Custom delimiter with special regex characters.
  test('supports delimiter with special regex characters like * and ?', () {
    final calculator = StringCalculator();
    expect(calculator.add('//[*?]\n1*?2*?3'), 6);
  });

  // Step 14: Handles input with only delimiters and no numbers.
  test('returns 0 if only delimiters are provided', () {
    final calculator = StringCalculator();
    expect(calculator.add(',,,\n\n'), 0);
  });
}
