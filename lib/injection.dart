import 'package:get_it/get_it.dart';
import 'package:paideia/data/datasources/db/database_helper.dart';
import 'package:paideia/data/datasources/student_data_source.dart';
import 'package:paideia/data/repositories/student_repository_impl.dart';
import 'package:paideia/domain/repositories/student_repository.dart';
import 'package:paideia/domain/usecases/get_average.dart';
import 'package:paideia/domain/usecases/get_maximum.dart';
import 'package:paideia/domain/usecases/get_minimum.dart';
import 'package:paideia/domain/usecases/get_rank_list.dart';
import 'package:paideia/domain/usecases/get_student_list.dart';
import 'package:paideia/presentation/bloc/rank_list/rank_list_bloc.dart';
import 'package:paideia/presentation/bloc/stats/stats_bloc.dart';
import 'package:paideia/presentation/bloc/student_list/student_list_bloc.dart';

final locator = GetIt.instance;

Future init() async {
  // bloc
  locator.registerFactory(() => StudentListBloc(getStudentList: locator()));
  locator.registerFactory(() => RankListBloc(getRankList: locator()));
  locator.registerFactory(() => StatsBloc(
    getAverage: locator(),
    getMaximum: locator(),
    getMinimum: locator(),
  ));

  // use case
  locator.registerLazySingleton(() => GetStudentList(locator()));
  locator.registerLazySingleton(() => GetRankList(locator()));
  locator.registerLazySingleton(() => GetAverage(locator()));
  locator.registerLazySingleton(() => GetMinimum(locator()));
  locator.registerLazySingleton(() => GetMaximum(locator()));

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
