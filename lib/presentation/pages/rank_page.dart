import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paideia/injection.dart';
import 'package:paideia/presentation/bloc/rank_list/rank_list_bloc.dart';
import 'package:paideia/presentation/widgets/drawer_menu.dart';
import 'package:paideia/presentation/widgets/student_list.dart';

class RankPage extends StatelessWidget {
  static const routeName = '/rank';
  final RankListBloc rankListBloc = locator();

  RankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(routeName),
      appBar: AppBar(
        title: const Text('Daftar Rank Siswa'),
      ),
      body: BlocProvider(
        create: (context) => rankListBloc,
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
  late RankListBloc rankListBloc;

  @override
  void initState() {
    rankListBloc = BlocProvider.of<RankListBloc>(context);
    rankListBloc.add(LoadRankListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder(
        bloc: rankListBloc,
        builder: (context, state) {
          if (state is RankListInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RankListLoadedState) {
            return StudentList(rankListBloc.rankList);
          } else {
              String message = state is LoadRankListFailureState
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
