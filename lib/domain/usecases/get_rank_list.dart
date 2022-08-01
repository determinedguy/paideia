import 'package:dartz/dartz.dart';
import 'package:paideia/domain/entities/student.dart';
import 'package:paideia/domain/repositories/student_repository.dart';
import 'package:paideia/common/failure.dart';

class GetRankList {
  final StudentRepository repository;

  GetRankList(this.repository);

  Future<Either<Failure, List<Student>>> execute() {
    return repository.getRankList();
  }
}
