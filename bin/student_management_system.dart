import 'package:student_management_system/models/student.dart';
import 'package:student_management_system/services/report_card_service.dart';
import 'package:student_management_system/services/student_service.dart';
import 'package:student_management_system/utils/input_output.dart';

void main() {
  StudentService studentService = StudentService();
  ReportCardService reportCardService = ReportCardService();

  while (true) {
    print('--- Student Management System ---');
    print('1. Add Student');
    print('2. Update Student');
    print('3. Delete Student');
    print('4. View Student');
    print('5. View All Students');
    print('6. Generate Report Card');
    print('7. Exit');
    String choice = InputOutput.getUserInput('Choose an option: ');

    switch (choice) {
      case '1':
        _addStudent(studentService);
        break;
      case '2':
        _updateStudent(studentService);
        break;
      case '3':
        _deleteStudent(studentService);
        break;
      case '4':
        _viewStudent(studentService);
        break;
      case '5':
        studentService.displayAllStudents();
        break;
      case '6':
        _generateReportCard(studentService, reportCardService);
        break;
      case '7':
        print('Exiting...');
        return;
      default:
        print('Invalid option. Please try again.');
    }
  }
}

void _addStudent(StudentService studentService) {
  Map<String, dynamic> details = InputOutput.promptForStudentDetails();
  Student student = Student(
    id: details['id'],
    name: details['name'],
    age: details['age'],
    subjects: details['subjects'],
  );
  studentService.addStudent(student);
}

void _updateStudent(StudentService studentService) {
  String id = InputOutput.getUserInput('Enter Student ID to update: ');
  Student? student = studentService.getStudentById(id);
  if (student == null) {
    InputOutput.displayMessage('Student not found.');
    return;
  }

  String? name = InputOutput.getUserInput('Enter new name (or leave blank): ');
  String? ageInput = InputOutput.getUserInput('Enter new age (or leave blank): ');
  int? age = ageInput.isEmpty ? null : int.parse(ageInput);

  Map<String, double> subjects = {};
  while (true) {
    String subject = InputOutput.getUserInput('Enter new subject (or "done" to finish): ');
    if (subject.toLowerCase() == 'done') break;
    double grade = double.parse(InputOutput.getUserInput('Enter Grade for $subject: '));
    subjects[subject] = grade;
  }

  studentService.updateStudent(id, name: name, age: age, subjects: subjects);
}

void _deleteStudent(StudentService studentService) {
  String id = InputOutput.getUserInput('Enter Student ID to delete: ');
  studentService.deleteStudent(id);
}

void _viewStudent(StudentService studentService) {
  String id = InputOutput.getUserInput('Enter Student ID to view: ');
  Student? student = studentService.getStudentById(id);
  if (student != null) {
    print(student);
  } else {
    InputOutput.displayMessage('Student not found.');
  }
}

void _generateReportCard(StudentService studentService, ReportCardService reportCardService) {
  String id = InputOutput.getUserInput('Enter Student ID to generate report card: ');
  Student? student = studentService.getStudentById(id);
  if (student != null) {
    reportCardService.generateReportCard(student);
  } else {
    InputOutput.displayMessage('Student not found.');
  }
}