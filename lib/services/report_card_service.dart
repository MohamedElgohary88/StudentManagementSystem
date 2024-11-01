import '../models/student.dart';

class ReportCardService {
  // Generate a report card for a student
  void generateReportCard(Student student) {
    print('--- Report Card for ${student.name} ---');
    if (student.subjects.isEmpty) {
      print('No subjects available.');
    } else {
      student.subjects.forEach((subject, grade) {
        print('Subject: $subject, Grade: $grade');
      });
      double averageGrade = student.calculateAverageGrade();
      print('Average Grade: ${averageGrade.toStringAsFixed(2)}');
    }
    print('-----------------------------');
  }

  
  // Calculate the average grade for a student
  double calculateAverageGrade(Student student) {
    return student.calculateAverageGrade();
  }
}
