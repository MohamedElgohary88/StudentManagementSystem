import 'dart:io';

class InputOutput {
  // Function to get user input as a string
  static String getUserInput(String prompt) {
    stdout.write(prompt);
    return stdin.readLineSync() ?? '';
  }

  // Function to display a message to the user
  static void displayMessage(String message) {
    print(message);
  }

  // Function to prompt for student details and return them as a map
  static Map<String, dynamic> promptForStudentDetails() {
    String id = getUserInput('Enter Student ID: ');
    String name = getUserInput('Enter Student Name: ');
    int age = int.parse(getUserInput('Enter Student Age: '));

    Map<String, double> subjects = {};
    while (true) {
      String subject = getUserInput('Enter Subject (or "done" to finish): ');
      if (subject.toLowerCase() == 'done') break;
      double grade = double.parse(getUserInput('Enter Grade for $subject: '));
      subjects[subject] = grade;
    }

    
    return {
      'id': id,
      'name': name,
      'age': age,
      'subjects': subjects,
    };
  }
}
