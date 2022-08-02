import 'package:paideia/data/datasources/db/database_helper.dart';
import 'package:paideia/domain/entities/student.dart';

abstract class StudentDataSource {
  Future<List<Student>> getStudentList();
  Future<List<Student>> getRankList();
  Future<List<String>> getAverage();
  Future<List<String>> getMinimum();
  Future<List<String>> getMaximum();
}

class StudentDataSourceImpl implements StudentDataSource {
  final DatabaseHelper databaseHelper;

  StudentDataSourceImpl({required this.databaseHelper});

  @override
  Future<List<Student>> getStudentList() async {
    final result = await databaseHelper.getStudentList();
    return result.map((data) => Student.fromJson(data)).toList();
  }

  @override
  Future<List<Student>> getRankList() async {
    final result = await databaseHelper.getStudentList();
    List<Student> data = result.map((data) => Student.fromJson(data)).toList();
    data.sort();
    return data;
  }

  @override
  Future<List<String>> getAverage() async {
    final result = await databaseHelper.getAverage();
    return result;
  }

  @override
  Future<List<String>> getMinimum() async {
    final result = await databaseHelper.getMinimum();
    return result;
  }

  @override
  Future<List<String>> getMaximum() async {
    final result = await databaseHelper.getMaximum();
    return result;
  }
}
