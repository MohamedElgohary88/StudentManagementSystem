import '../models/student.dart';

class StudentService {
  final Map<String, Student> _students = {};

  // Add a new student
  void addStudent(Student student) {
    if (_students.containsKey(student.id)) {
      print('Student with ID ${student.id} already exists.');
      return;
    }
    _students[student.id] = student;
    print('Student ${student.name} added successfully.');
  }

  // Update an existing student
  void updateStudent(String id,
      {String? name, int? age, Map<String, double>? subjects}) {
    final student = _students[id];
    if (student == null) {
      print('Student with ID $id not found.');
      return;
    }
    if (name != null) student.name = name;
    if (age != null) student.age = age;
    if (subjects != null) student.subjects = subjects;
    print('Student ${student.name} updated successfully.');
  }

  // Delete a student
  void deleteStudent(String id) {
    if (_students.remove(id) != null) {
      print('Student with ID $id deleted successfully.');
    } else {
      print('Student with ID $id not found.');
    }
  }

  // Get a student by ID
  Student? getStudentById(String id) {
    return _students[id];
  }

  // Display all students
  void displayAllStudents() {
    if (_students.isEmpty) {
      print('No students available.');
    } else {
      _students.values.forEach((student) => print(student));
    }
  }
}
