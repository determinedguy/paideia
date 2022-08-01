import 'package:dartz/dartz.dart';
import 'package:paideia/domain/entities/student.dart';
import 'package:paideia/domain/repositories/student_repository.dart';
import 'package:paideia/common/failure.dart';

class GetStudentList {
  final StudentRepository repository;

  GetStudentList(this.repository);

  Future<Either<Failure, List<Student>>> execute() {
    return repository.getStudentList();
  }
}
