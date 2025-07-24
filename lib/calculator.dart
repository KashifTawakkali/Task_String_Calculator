class StringCalculator {
  int add(String numbers) {
    // Step 1: Return 0 if the input string is empty
    if (numbers.isEmpty) {
      return 0;
    }

    // Step 6: Check if a custom delimiter is defined using the //delimiter\n format
    String delimiterPattern =
        '[,\n]'; // Step 3 & 5: Default delimiters are comma and newline
    String numbersSection = numbers;

    if (numbers.startsWith('//')) {
      final delimiterEnd = numbers.indexOf('\n');
      final delimiter = numbers.substring(2, delimiterEnd);
      delimiterPattern =
          '[$delimiter\n]'; // Step 6: Replace delimiter pattern with custom one
      numbersSection = numbers.substring(delimiterEnd + 1);
    }

    // Step 1 (again): Return 0 if the number section is empty after delimiter handling
    if (numbersSection.isEmpty) {
      return 0;
    }

    // Step 2: Handles a single number
    // Step 4: Handles multiple numbers
    // Step 5: Supports splitting by comma and newline (or custom delimiter from Step 6)
    final parts = numbersSection
        .split(RegExp(delimiterPattern))
        .where((p) => p.isNotEmpty);

    final numbersList = parts.map(int.parse).toList();

    // Step 7: Throw exception if negative numbers are present
    final negatives = numbersList.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed: ${negatives.join(',')}');
    }

    return numbersList.reduce((a, b) => a + b);
  }
}
