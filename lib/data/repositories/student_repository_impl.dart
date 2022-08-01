import 'package:dartz/dartz.dart';
import 'package:paideia/data/datasources/student_data_source.dart';
import 'package:paideia/domain/entities/student.dart';
import 'package:paideia/domain/repositories/student_repository.dart';
import 'package:paideia/common/failure.dart';

class StudentRepositoryImpl implements StudentRepository {
  final StudentDataSource dataSource;

  StudentRepositoryImpl({
    required this.dataSource
  });

  @override
  Future<Either<Failure, List<Student>>> getStudentList() async {
    final result = await dataSource.getStudentList();
    return Right(result.map((model) => model.toEntity()).toList());
  }

  @override
  Future<Either<Failure, List<Student>>> getRankList() async {
    final result = await dataSource.getRankList();
    return Right(result.map((model) => model.toEntity()).toList());
  }

  @override
  Future<Either<Failure, List<String>>> getAverage() async {
    final result = await dataSource.getAverage();
    return Right(result);
  }

  @override
  Future<Either<Failure, List<String>>> getMaximum() async {
    final result = await dataSource.getMaximum();
    return Right(result);
  }

  @override
  Future<Either<Failure, List<String>>> getMinimum() async {
    final result = await dataSource.getMinimum();
    return Right(result);
  }
}
