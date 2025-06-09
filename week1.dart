void main() {
  // Task 1: Define Variables
  int age = 25;
  double height = 5.9;
  String name = "John Doe";
  bool isStudent = true;
  List<int> numbers = [1, 2, 3, 4, 5];

  print("Integer: $age");
  print("Double: $height");
  print("String: $name");
  print("Boolean: $isStudent");
  print("List: $numbers");

  // Task 2: Type Conversion
  int stringToInt(String value) => int.parse(value);
  double stringToDouble(String value) => double.parse(value);
  String intToString(int value) => value.toString();
  double intToDouble(int value) => value.toDouble();

  // Task 3: Conversion Function
  void convertAndDisplay(String number) {
    try {
      int intValue = stringToInt(number);
      double doubleValue = stringToDouble(number);
      print("Converted to int: $intValue");
      print("Converted to double: $doubleValue");
    } catch (e) {
      print("Error converting '$number': $e");
    }
  }

  // Test conversion
  convertAndDisplay("42");

  // Task 4: Control Flow
  // If-Else: Check number sign
  void checkNumber(int num) {
    if (num > 0) {
      print("$num is positive");
    } else if (num < 0) {
      print("$num is negative");
    } else {
      print("$num is zero");
    }
  }

  // If-Else: Voting eligibility
  void checkVotingEligibility(int age) {
    if (age >= 18) {
      print("Age $age: Eligible to vote");
    } else {
      print("Age $age: Not eligible to vote");
    }
  }

  // Switch Case: Day of the week
  void printDay(int day) {
    switch (day) {
      case 1:
        print("Monday");
        break;
      case 2:
        print("Tuesday");
        break;
      case 3:
        print("Wednesday");
        break;
      case 4:
        print("Thursday");
        break;
      case 5:
        print("Friday");
        break;
      case 6:
        print("Saturday");
        break;
      case 7:
        print("Sunday");
        break;
      default:
        print("Invalid day");
    }
  }

  // Loops
  // For loop: 1 to 10
  for (int i = 1; i <= 10; i++) {
    print("For loop: $i");
  }

  // While loop: 10 to 1
  int j = 10;
  while (j >= 1) {
    print("While loop: $j");
    j--;
  }

  // Do-while loop: 1 to 5
  int k = 1;
  do {
    print("Do-while loop: $k");
    k++;
  } while (k <= 5);

  // Task 5: Combine Data & Control Flow
  void processList(List<int> numbers) {
    for (int num in numbers) {
      // Check even or odd
      print("$num is ${num % 2 == 0 ? 'even' : 'odd'}");

      // Categorize number
      if (num >= 1 && num <= 10) {
        print("$num is small");
      } else if (num >= 11 && num <= 100) {
        print("$num is medium");
      } else if (num >= 101) {
        print("$num is large");
      } else {
        print("$num is out of range");
      }
    }
  }

  // Test control flow functions
  checkNumber(0);
  checkNumber(10);
  checkNumber(-5);

  checkVotingEligibility(17);
  checkVotingEligibility(20);

  printDay(3);
  printDay(9); // Invalid

  processList([5, 15, 150, 0]);
}
