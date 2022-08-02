import 'package:flutter/material.dart';
import 'package:paideia/presentation/pages/home_page.dart';
import 'package:paideia/presentation/pages/rank_page.dart';

class DrawerMenu extends StatelessWidget {
  final String route;

  const DrawerMenu(this.route, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              height: 64,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'paideia',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ListTile(
                    title: const Text('Homepage'),
                    onTap: () {
                      route == HomePage.routeName
                        ? Navigator.pop(context)
                        : Navigator.pushReplacementNamed(context, HomePage.routeName);
                    },
                  ),
                  ListTile(
                    title: const Text('Rank Page'),
                    onTap: () {
                      route == RankPage.routeName
                        ? Navigator.pop(context)
                        : Navigator.pushReplacementNamed(context, RankPage.routeName);
                    },
                  ),
                  ListTile(
                    title: const Text('Statistics'),
                    onTap: () {
                      route == HomePage.routeName
                        ? Navigator.pop(context)
                        : Navigator.pushReplacementNamed(context, HomePage.routeName);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}