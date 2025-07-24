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
    
    // Step 3: Add two numbers separated by a comma.
      if (numbers.contains(',')) {
      final parts = numbers.split(',');
      return parts.map(int.parse).reduce((a, b) => a + b);
    }
    
    return 0;
  }
} 