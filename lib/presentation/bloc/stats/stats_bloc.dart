import 'package:bloc/bloc.dart';
import 'package:paideia/domain/usecases/get_average.dart';
import 'package:paideia/domain/usecases/get_maximum.dart';
import 'package:paideia/domain/usecases/get_minimum.dart';
import 'package:equatable/equatable.dart';

part 'stats_event.dart';
part 'stats_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final GetAverage _getAverage;
  final GetMaximum _getMaximum;
  final GetMinimum _getMinimum;
  List<String> _average = [];
  List<String> _maximum = [];
  List<String> _minimum = [];

  StatsBloc({
    required GetAverage getAverage,
    required GetMaximum getMaximum,
    required GetMinimum getMinimum,
  })  : _getAverage = getAverage,
        _getMaximum = getMaximum,
        _getMinimum = getMinimum,
        super(StatsInitial()) {
    on<LoadStatsEvent>(_loadHome);
  }

  List<String> get average => _average;

  List<String> get maximum => _maximum;

  List<String> get minimum => _minimum;

  void _loadHome(
    LoadStatsEvent event,
    Emitter<StatsState> emit,
  ) async {
    emit(StatsInitial());
    final averageResult = await _getAverage.execute();
    final maximumResult = await _getMaximum.execute();
    final minimumResult = await _getMinimum.execute();
    int countResult = 0;
    String errorMessage = "";
    averageResult.fold((failure) {
      errorMessage = failure.message;
    }, (data) {
      countResult++;
      _average = data;
    });

    if (countResult == 1) {
      maximumResult.fold((failure) {
        errorMessage = failure.message;
      }, (data) {
        countResult++;
        _maximum = data;
      });
    }

    if (countResult == 2) {
      minimumResult.fold((failure) {
        errorMessage = failure.message;
      }, (data) {
        countResult++;
        _minimum = data;
      });
    }

    if (countResult == 3) {
      emit(StatsLoadedState());
    } else {
      emit(LoadStatsFailureState(
        message: errorMessage,
      ));
    }
  }
}
