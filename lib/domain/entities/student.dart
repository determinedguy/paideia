import 'package:equatable/equatable.dart';

class Student extends Equatable implements Comparable<Student> {
  const Student({
    required this.no,
    required this.nama,
    required this.waktu,
    required this.nilai,
  });

  final int no;
  final String nama;
  final double waktu;
  final double nilai;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        no: json["No"],
        nama: json["Nama"],
        waktu: json["Waktu"].toDouble(),
        nilai: json["Nilai"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "No": no,
        "Nama": nama,
        "Waktu": waktu,
        "Nilai": nilai,
      };

  @override
  List<Object?> get props => [
        no,
        nama,
        waktu,
        nilai,
      ];

  @override
  int compareTo(Student other) {
    if (nilai > other.nilai) {
      return -1;
    } else if (nilai < other.nilai) {
      return 1;
    } else {
      if (waktu < other.waktu) {
        return -1;
      } else if (waktu > other.waktu) {
        return 1;
      } else {
        return 0;
      }
    }
  }
}
