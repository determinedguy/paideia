import 'package:get_it/get_it.dart';
import 'package:paideia/data/datasources/db/database_helper.dart';
import 'package:paideia/data/datasources/student_data_source.dart';
import 'package:paideia/data/repositories/student_repository_impl.dart';
import 'package:paideia/domain/repositories/student_repository.dart';
import 'package:paideia/domain/usecases/get_student_list.dart';
import 'package:paideia/presentation/bloc/student_list/student_list_bloc.dart';

final locator = GetIt.instance;

Future init() async {
  // bloc
  locator.registerFactory(() => StudentListBloc(getStudentList: locator()));

  // use case
  locator.registerLazySingleton(() => GetStudentList(locator()));

  // repository
  locator.registerLazySingleton<StudentRepository>(
    () => StudentRepositoryImpl(
      dataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<StudentDataSource>(
      () => StudentDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
}
