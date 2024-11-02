class Student {
  final String id;
  String name;
  int age;
  Map<String, double> subjects;

  Student({
    required this.id,
    required this.name,
    required this.age,
    Map<String, double>? subjects,
  }) : subjects = subjects ?? {};

  // Method to add or update a subject grade
  void addOrUpdateSubject(String subject, double grade) {
    subjects[subject] = grade;
  }

  // Method to remove a subject
  void removeSubject(String subject) {
    subjects.remove(subject);
  }

  // Method to calculate the average grade
  double calculateAverageGrade() {
    if (subjects.isEmpty) {
      return 0.0;
    }
    double total = subjects.values.reduce((a, b) => a + b);
    return total / subjects.length;
  }

  // Method to display the student's details
  @override
  String toString() {
    return 'ID: $id, Name: $name, Age: $age, Subjects: $subjects';
  }
}
