part of 'student_list_bloc.dart';

abstract class StudentListState extends Equatable {
  const StudentListState();

  @override
  List<Object> get props => [];
}

class StudentListInitial extends StudentListState {}

class StudentListLoadedState extends StudentListState {}

class LoadStudentListFailureState extends StudentListState {
  final String message;

  LoadStudentListFailureState({
    this.message = "",
  });
}
