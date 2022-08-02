import 'package:paideia/domain/entities/student.dart';
import 'package:flutter/material.dart';

class StudentTile extends StatelessWidget {
  final Student student;

  const StudentTile(this.student, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            // Nama
            title: Text(
              student.nama,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const SizedBox(),
            subtitle: Column(children: [
              // Waktu
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, right: 16.0, bottom: 8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Nilai: ${student.nilai}',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              ),
              // Nilai
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, right: 16.0, bottom: 16.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Waktu: ${student.waktu}',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
