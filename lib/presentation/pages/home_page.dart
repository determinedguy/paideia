import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paideia/injection.dart';
import 'package:paideia/presentation/bloc/student_list/student_list_bloc.dart';
import 'package:paideia/presentation/widgets/drawer_menu.dart';
import 'package:paideia/presentation/widgets/student_list.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  final StudentListBloc studentListBloc = locator();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(routeName),
      appBar: AppBar(
        title: const Text('Daftar Siswa'),
      ),
      body: BlocProvider(
        create: (context) => studentListBloc,
        child: const PageContentSection(),
      ),
    );
  }
}

class PageContentSection extends StatefulWidget {
  const PageContentSection({Key? key}) : super(key: key);

  @override
  PageContentSectionState createState() => PageContentSectionState();
}

class PageContentSectionState extends State<PageContentSection> {
  late StudentListBloc studentListBloc;

  @override
  void initState() {
    studentListBloc = BlocProvider.of<StudentListBloc>(context);
    studentListBloc.add(LoadStudentListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder(
        bloc: studentListBloc,
        builder: (context, state) {
          if (state is StudentListInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is StudentListLoadedState) {
            return StudentList(studentListBloc.studentList);
          } else {
              String message = state is LoadStudentListFailureState
                  ? state.message
                  : "Error";
              return Center(
                key: const Key('error_message'),
                child: Text(message),
              );
            }
        },
      ),
    );
  }
}
