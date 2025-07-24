// Step 1: An empty input string should return 0 as there are no numbers to add.
class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }
    // Step 2: If there's only one number in the string, return that number.
    if (!numbers.contains(',')) {
      return int.parse(numbers);
    }

    // Step 3 & 5 : Add two numbers separated by a comma, Allow newline character as an additional delimiter along with commas.
    final delimiters = [',', '\n'];
    final parts = numbers.split(RegExp('[,\n]'));
    return parts.map(int.parse).reduce((a, b) => a + b);
  }
}
