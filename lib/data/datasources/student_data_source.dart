import 'package:paideia/common/exception.dart';
import 'package:paideia/data/datasources/db/database_helper.dart';
import 'package:paideia/data/models/student_model.dart';

abstract class StudentDataSource {
  Future<List<StudentModel>> getStudentList();
  Future<List<StudentModel>> getRankList();
  Future<List<String>> getAverage();
  Future<List<String>> getMinimum();
  Future<List<String>> getMaximum();

}

class StudentDataSourceImpl implements StudentDataSource {
  final DatabaseHelper databaseHelper;

  StudentDataSourceImpl({required this.databaseHelper});

  @override
  Future<List<StudentModel>> getStudentList() async {
    final result = await databaseHelper.getStudentList();
    return result.map((data) => StudentModel.fromJson(data)).toList();
  }

  @override
  Future<List<StudentModel>> getRankList() async {
    final result = await databaseHelper.getRankList();
    return result.map((data) => StudentModel.fromJson(data)).toList();
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
