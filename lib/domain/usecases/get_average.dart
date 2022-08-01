import 'package:dartz/dartz.dart';
import 'package:paideia/domain/repositories/student_repository.dart';
import 'package:paideia/common/failure.dart';

class GetAverage {
  final StudentRepository repository;

  GetAverage(this.repository);

  Future<Either<Failure, List<String>>> execute() {
    return repository.getAverage();
  }
}
