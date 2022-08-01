import 'package:dartz/dartz.dart';
import 'package:paideia/domain/entities/student.dart';
import 'package:paideia/common/failure.dart';

abstract class StudentRepository {
  Future<Either<Failure, List<Student>>> getStudentList();
  Future<Either<Failure, List<Student>>> getRankList();
  Future<Either<Failure, List<String>>> getAverage();
  Future<Either<Failure, List<String>>> getMinimum();
  Future<Either<Failure, List<String>>> getMaximum();
}
