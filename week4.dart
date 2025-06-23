import 'dart:io';
import 'dart:convert';

void main() {
  // Initialize collections
  List<String> results = [];
  Set<String> uniqueResults = {};
  Map<String, dynamic> logEntries = {};

  while (true) {
    print('\nUtility App Menu:');
    print('1. Manipulate String');
    print('2. View Results');
    print('3. Save to File');
    print('4. Exit');
    stdout.write('Enter your choice (1-4): ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter a string: ');
        String? input = stdin.readLineSync();
        if (input != null && input.isNotEmpty) {
          // String Manipulation
          String concatenated = input + ' (Modified)';
          String reversed = input.split('').reversed.join();
          String upperCase = input.toUpperCase();
          String lowerCase = input.toLowerCase();

          // Store results
          String result = 'Original: $input\nConcatenated: $concatenated\nReversed: $reversed\nUpper: $upperCase\nLower: $lowerCase';
          results.add(result);
          uniqueResults.add(input); // Only unique inputs
          logEntries[DateTime.now().toIso8601String()] = result;

          print('\nString Manipulation Results:\n$result');
        } else {
          print('Invalid input! Please enter a string.');
        }
        break;

      case '2':
        if (results.isEmpty) {
          print('\nNo results yet. Please manipulate a string first.');
        } else {
          print('\nAll Results:');
          for (int i = 0; i < results.length; i++) {
            print('Entry ${i + 1}: ${results[i]}');
          }
          print('Unique Inputs: $uniqueResults');
          print('Log Entries: $logEntries');
        }
        break;

      case '3':
        if (logEntries.isEmpty) {
          print('\nNo data to save. Please manipulate a string first.');
        } else {
          try {
            // File Handling: Read from input.txt and write to output.txt
            File inputFile = File('input.txt');
            String inputContent = inputFile.existsSync() ? inputFile.readAsStringSync() : 'No previous input';
            File outputFile = File('output.txt');
            String logData = 'Date/Time: ${DateTime.now()}\nResults: ${jsonEncode(logEntries)}\nInput Content: $inputContent';
            outputFile.writeAsStringSync(logData, mode: FileMode.write);
            print('\nData saved to output.txt successfully!');
          } catch (e) {
            print('Error handling file: $e');
          }
        }
        break;

      case '4':
        print('\nExiting Utility App. Goodbye!');
        return;

      default:
        print('\nInvalid choice! Please enter a number between 1 and 4.');
    }
  }
}