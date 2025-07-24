class StringCalculator {
  int add(String numbers) {
    // Step 1: Return 0 if the input string is empty
    if (numbers.isEmpty) {
      return 0;
    }

    String numbersSection = numbers;
    String delimiterPattern = '[,\n]'; // Step 3 & 5: Default delimiters are comma and newline

    // Step 6 & Step 9: Check for custom delimiter syntax
    if (numbers.startsWith('//')) {
      final delimiterEnd = numbers.indexOf('\n');
      final delimiterSection = numbers.substring(2, delimiterEnd);

      if (delimiterSection.startsWith('[')) {
        // Step 9: Support multiple or multi-character delimiters using //[delim] format
        final matches = RegExp(r'\[(.*?)\]').allMatches(delimiterSection);
        final delimiters = matches.map((m) => RegExp.escape(m.group(1)!)).toList();
        delimiterPattern = delimiters.join('|');
      } else {
        // Step 6: Handle single custom delimiter
        delimiterPattern = RegExp.escape(delimiterSection);
      }

      numbersSection = numbers.substring(delimiterEnd + 1);
    }

    // Step 1 (again): Return 0 if the number section is empty after delimiter handling
    if (numbersSection.isEmpty) {
      return 0;
    }

    // Step 2: If only one number, return that number (also covered by sum logic)
    // Step 3, 4, 5, 6, 9: Split input using comma, newline, or custom delimiter(s)
    final parts = numbersSection
        .split(RegExp(delimiterPattern))
        .where((p) => p.isNotEmpty);

    final numbersList = parts.map(int.parse).toList();
    print('Parsed numbers: $numbersList');

    // Step 7: Throw exception if negative numbers are present
    final negatives = numbersList.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed: ${negatives.join(',')}');
    }

    // Step 8: Ignore numbers greater than 1000
    final filtered = numbersList.where((n) => n <= 1000);
    print('Filtered (<=1000) numbers: $filtered');

    return filtered.fold(0, (a, b) => a + b);
  }
}
