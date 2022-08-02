import 'package:bloc/bloc.dart';
import 'package:paideia/domain/entities/student.dart';
import 'package:paideia/domain/usecases/get_rank_list.dart';
import 'package:equatable/equatable.dart';

part 'rank_list_event.dart';
part 'rank_list_state.dart';

class RankListBloc extends Bloc<RankListEvent, RankListState> {
  final GetRankList _getRankList;
  List<Student> _rankList = [];

  RankListBloc({
    required GetRankList getRankList,
  })  : _getRankList = getRankList,
        super(RankListInitial()) {
    on<LoadRankListEvent>(_loadHome);
  }

  List<Student> get rankList => _rankList;

  void _loadHome(
    LoadRankListEvent event,
    Emitter<RankListState> emit,
  ) async {
    emit(RankListInitial());
    final result = await _getRankList.execute();
    result.fold(
        (failure) => emit(LoadRankListFailureState()),
        (data) {
          _rankList = data;
          emit(RankListLoadedState());
        },
      );
  }
}
