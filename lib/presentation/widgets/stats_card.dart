import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final List<String> data;

  const StatsCard(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            // Nama
            title: Text(
              data.elementAt(0),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const SizedBox(),
            subtitle: Column(children: [
              // Waktu
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, right: 16.0, bottom: 8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Nilai: ${data.elementAt(1)}',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              ),
              // Nilai
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, right: 16.0, bottom: 16.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Waktu: ${data.elementAt(2)}',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
