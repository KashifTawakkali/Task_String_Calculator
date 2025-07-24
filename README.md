
# 📟 String Calculator

A Flutter-based implementation of a string calculator that parses and sums numbers from a string input, supporting custom delimiters, input validation, and various edge cases.

---

## 🚀 Features Covered

This calculator supports the following:

1. **Empty input** returns `0`.
2. **Single number input** returns the number itself.
3. **Comma-separated values** are summed.
4. **Multiple numbers** separated by commas are handled.
5. **Newline as delimiter** is supported (`\n` and `,` can mix).
6. **Single custom delimiter** using format `//;\n1;2`.
7. **Negative numbers** throw an exception with the list of negatives.
8. **Numbers > 1000** are ignored in the sum.
9. **Multi-character and multiple custom delimiters** using `//[***][%%]\n1***2%%3`.
10. Handles **empty/missing delimiters**, **skips empty tokens**, and escapes **special characters** in delimiters.

---

## 🧪 How to Run Tests

Make sure Flutter is installed.

1. Navigate to your project root.
2. Run the test command:

```bash
flutter test
```

This will execute all test cases in `test/string_calculator_test.dart`.

---

## 📁 File Structure

```
lib/
└── calculator.dart         # StringCalculator class implementation

test/
└── string_calculator_test.dart  # Unit tests for all features
```

---

## 🛠 Example Inputs & Outputs

```dart
StringCalculator().add("1,2,3");            // Output: 6
StringCalculator().add("//;\n1;2");         // Output: 3
StringCalculator().add("//[***]\n1***2***3") // Output: 6
StringCalculator().add("1001,2");           // Output: 2
StringCalculator().add("1,-2");             // Throws: Exception
```

---

## ✅ Requirements Met

* [x] TDD Driven (Test-first approach)
* [x] Edge cases & exception handling
* [x] Modular and scalable structure
* [x] Easy to extend with new rules

---



