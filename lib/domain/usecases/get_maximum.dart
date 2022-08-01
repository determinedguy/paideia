import 'package:dartz/dartz.dart';
import 'package:paideia/domain/repositories/student_repository.dart';
import 'package:paideia/common/failure.dart';

class GetMaximum {
  final StudentRepository repository;

  GetMaximum(this.repository);

  Future<Either<Failure, List<String>>> execute() {
    return repository.getMaximum();
  }
}
