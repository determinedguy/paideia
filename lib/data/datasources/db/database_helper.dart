import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static List? _database;

  Future<List?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  Future<List> _initDb() async {
    final String response = await rootBundle.loadString('assets/data.json');

    final db = await json.decode(response);
    return db;
  }

  Future<List<dynamic>> getStudentList() async {
    final db = await database;
    final List<dynamic> results = db!;

    return results;
  }

  Future<List<String>> getAverage() async {
    final db = await database;
    var timeAverage = db!.map((m) => m['Waktu']).reduce((a, b) => a + b) / db.length;
    var scoreAverage = db.map((m) => m['Nilai']).reduce((a, b) => a + b) / db.length;

    return ["Rata-Rata", scoreAverage.toString(), timeAverage.toString()];
  }

  Future<List<String>> getMinimum() async {
    final db = await database;
    var timeMinimum = db!.map((m) => m['Waktu']).reduce((curr, next) => curr < next? curr: next);
    var scoreMinimum = db.map((m) => m['Nilai']).reduce((curr, next) => curr < next? curr: next);

    return ["Minimum", scoreMinimum.toString(), timeMinimum.toString()];
  }

  Future<List<String>> getMaximum() async {
    final db = await database;
    var timeMaximum = db!.map((m) => m['Waktu']).reduce((curr, next) => curr > next? curr: next);
    var scoreMaximum = db.map((m) => m['Nilai']).reduce((curr, next) => curr > next? curr: next);

    return ["Maksimum", scoreMaximum.toString(), timeMaximum.toString()];
  }
}
