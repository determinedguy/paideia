import 'package:bloc/bloc.dart';
import 'package:paideia/domain/entities/student.dart';
import 'package:paideia/domain/usecases/get_student_list.dart';
import 'package:equatable/equatable.dart';

part 'student_list_event.dart';

part 'student_list_state.dart';

class StudentListBloc extends Bloc<StudentListEvent, StudentListState> {
  final GetStudentList _getStudentList;
  List<Student> _studentList = [];

  StudentListBloc({
    required GetStudentList getStudentList,
  })  : _getStudentList = getStudentList,
        super(StudentListInitial()) {
    on<LoadStudentListEvent>(_loadHome);
  }

  List<Student> get studentList => _studentList;

  void _loadHome(
    LoadStudentListEvent event,
    Emitter<StudentListState> emit,
  ) async {
    emit(StudentListInitial());
    final studentListResult = await _getStudentList.execute();
    int countResult = 0;
    String errorMessage = "";
    studentListResult.fold((failure) {
      errorMessage = failure.message;
    }, (student) {
      countResult++;
      _studentList = student;
    });

    if (countResult == 1) {
      emit(StudentListLoadedState());
    } else {
      emit(LoadStudentListFailureState(
        message: errorMessage,
      ));
    }
  }
}
