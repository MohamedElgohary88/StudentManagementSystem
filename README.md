# Student Management System

This is a console-based Student Management System written in Dart. It allows you to manage student records, including adding, updating, and deleting student information. The system also includes functionality for calculating grades and generating report cards.

## Features

- **Add Student:** Add a new student with details like ID, name, age, and subjects.
- **Update Student:** Update the details of an existing student.
- **Delete Student:** Remove a student from the system.
- **View Student:** View details of a specific student by ID.
- **View All Students:** Display a list of all students in the system.
- **Generate Report Card:** Calculate the average grade and generate a report card for a student.

# Getting Started

## Prerequisites
Dart SDK: Make sure Dart is installed on your system. You can download it from dart.dev.
Running the Application
Clone the repository:

git clone https://github.com/yourusername/student-management-system.git
cd student-management-system

## Run the application:

dart run lib/main.dart
Running Tests
To run the unit tests for this project, execute the following command:

## dart test
Usage
Once the application is running, you can interact with it using the menu options provided. Enter the number corresponding to the action you want to take (e.g., 1 for adding a student, 2 for updating a student, etc.).

## Example
## --- Student Management System ---
1. Add Student
2. Update Student
3. Delete Student
4. View Student
5. View All Students
6. Generate Report Card
7. Exit
Choose an option: 1
Enter Student ID: 001
Enter Student Name: John Doe
Enter Student Age: 20
Enter Subject (or "done" to finish): Math
Enter Grade for Math: 85
Enter Subject (or "done" to finish): Science
Enter Grade for Science: 90
Enter Subject (or "done" to finish): done
Student added successfully!
## Contributing
If you'd like to contribute to this project, please fork the repository and submit a pull request. Contributions, issues, and feature requests are welcome!

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

## Project Structure

```bash
├── lib
│   ├── models
│   │   └── student.dart                # Defines the Student class
│   ├── services
│   │   ├── student_service.dart        # Provides CRUD operations for Student
│   │   └── report_card_service.dart    # Handles report card generation and grade calculations
│   ├── utils
│   │   └── input_output.dart           # Handles user input and output in the console
│   └── main.dart                       # Main entry point of the application with menu-driven interface
└── test
    └── student_management_system_test.dart  # Unit tests for the application
