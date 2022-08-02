part of 'rank_list_bloc.dart';

abstract class RankListEvent extends Equatable {
  const RankListEvent();

  @override
  List<Object?> get props => [];
}

class LoadRankListEvent extends RankListEvent {}
