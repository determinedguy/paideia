import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paideia/injection.dart';
import 'package:paideia/presentation/bloc/stats/stats_bloc.dart';
import 'package:paideia/presentation/widgets/drawer_menu.dart';
import 'package:paideia/presentation/widgets/stats_card.dart';

class StatsPage extends StatelessWidget {
  static const routeName = '/stats';
  final StatsBloc statsBloc = locator();

  StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(routeName),
      appBar: AppBar(
        title: const Text('Statistik'),
      ),
      body: BlocProvider(
        create: (context) => statsBloc,
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
  late StatsBloc statsBloc;

  @override
  void initState() {
    statsBloc = BlocProvider.of<StatsBloc>(context);
    statsBloc.add(LoadStatsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder(
        bloc: statsBloc,
        builder: (context, state) {
          if (state is StatsInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is StatsLoadedState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatsCard(statsBloc.average),
                  StatsCard(statsBloc.minimum),
                  StatsCard(statsBloc.maximum),
                ],
              ),
            );
          } else {
              String message = state is LoadStatsFailureState
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
