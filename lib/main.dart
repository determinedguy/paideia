import 'package:flutter/material.dart';
import 'package:paideia/presentation/pages/home_page.dart';
import 'package:paideia/injection.dart' as di;
import 'package:paideia/presentation/pages/rank_page.dart';
import 'package:paideia/presentation/pages/stats_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Paideia',
        home: HomePage(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomePage.routeName:
              return MaterialPageRoute(builder: (_) => HomePage());
            case RankPage.routeName:
              return MaterialPageRoute(builder: (_) => RankPage());
            case StatsPage.routeName:
              return MaterialPageRoute(builder: (_) => StatsPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      );
  }
}
