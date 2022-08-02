part of 'rank_list_bloc.dart';

abstract class RankListState extends Equatable {
  const RankListState();

  @override
  List<Object> get props => [];
}

class RankListInitial extends RankListState {}

class RankListLoadedState extends RankListState {}

class LoadRankListFailureState extends RankListState {
  final String message;

  LoadRankListFailureState({
    this.message = "",
  });
}
