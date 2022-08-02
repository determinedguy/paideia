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
    final result = await _getStudentList.execute();
    result.fold(
        (failure) => emit(LoadStudentListFailureState()),
        (data) {
          _studentList = data;
          emit(StudentListLoadedState());
        },
      );
  }
}
