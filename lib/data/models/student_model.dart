import 'package:equatable/equatable.dart';
import 'package:paideia/domain/entities/student.dart';

class StudentModel extends Equatable {
  const StudentModel({
    required this.no,
    required this.nama,
    required this.waktu,
    required this.nilai,
  });

  final int no;
  final String nama;
  final double waktu;
  final double nilai;

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
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

  Student toEntity() {
    return Student(
      no: no,
      nama: nama,
      waktu: waktu,
      nilai: nilai,
    );
  }

  @override
  List<Object?> get props => [
        no,
        nama,
        waktu,
        nilai,
      ];
}
