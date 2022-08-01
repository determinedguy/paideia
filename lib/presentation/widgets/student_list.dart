
import 'package:flutter/material.dart';
import 'package:paideia/domain/entities/student.dart';
import 'package:paideia/presentation/widgets/student_tile.dart';

class StudentList extends StatelessWidget {
  final List<Student> students;

  const StudentList(this.students, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final student = students[index];
        return StudentTile(student);
      },
      itemCount: students.length,
    );
  }
}
