import 'package:student_management_system/models/student.dart';
import 'package:student_management_system/services/report_card_service.dart';
import 'package:student_management_system/services/student_service.dart';
import 'package:test/test.dart';

void main() {
  group('Student Tests', () {
    test('Create a student and check properties', () {
      final student = Student(id: '1', name: 'John Doe', age: 20);
      expect(student.id, '1');
      expect(student.name, 'John Doe');
      expect(student.age, 20);
    });

    test('Add and update subjects for a student', () {
      final student = Student(id: '2', name: 'Jane Doe', age: 22);
      student.addOrUpdateSubject('Math', 90);
      student.addOrUpdateSubject('Science', 85);
      expect(student.subjects.length, 2);
      expect(student.subjects['Math'], 90);
      expect(student.subjects['Science'], 85);

      student.addOrUpdateSubject('Math', 95); // Update Math grade
      expect(student.subjects['Math'], 95);
    });

    test('Calculate average grade', () {
      final student = Student(id: '3', name: 'Alice', age: 18);
      student.addOrUpdateSubject('Math', 80);
      student.addOrUpdateSubject('Science', 70);
      expect(student.calculateAverageGrade(), 75);
    });
  });

  group('StudentService Tests', () {
    final studentService = StudentService();

    test('Add and retrieve student', () {
      final student = Student(id: '4', name: 'Bob', age: 25);
      studentService.addStudent(student);
      final retrievedStudent = studentService.getStudentById('4');
      expect(retrievedStudent, isNotNull);
      expect(retrievedStudent!.name, 'Bob');
    });

    test('Update student', () {
      studentService.updateStudent('4', name: 'Robert', age: 26);
      final updatedStudent = studentService.getStudentById('4');
      expect(updatedStudent!.name, 'Robert');
      expect(updatedStudent.age, 26);
    });

    test('Delete student', () {
      studentService.deleteStudent('4');
      final deletedStudent = studentService.getStudentById('4');
      expect(deletedStudent, isNull);
    });
  });

  group('ReportCardService Tests', () {
    final reportCardService = ReportCardService();

    test('Generate report card', () {
      final student = Student(id: '5', name: 'Eve', age: 21);
      student.addOrUpdateSubject('Math', 88);
      student.addOrUpdateSubject('Science', 92);

      // This test will just check if the report card generation works without throwing errors.
      reportCardService.generateReportCard(student);
    });

    test('Calculate average grade using ReportCardService', () {
      final student = Student(id: '6', name: 'Charlie', age: 23);
      student.addOrUpdateSubject('Math', 75);
      student.addOrUpdateSubject('Science', 85);
      final averageGrade = reportCardService.calculateAverageGrade(student);
      expect(averageGrade, 80);
    });
  });
}
