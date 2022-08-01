import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:paideia/data/models/student_model.dart';

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

  Future<List<dynamic>> getRankList() async {
    final db = await database;
    final List<dynamic> results = db!;

    return results;
  }

  Future<List<dynamic>> getAverage() async {
    final db = await database;
    final List<dynamic> results = db!;

    return results;
  }

  Future<List<dynamic>> getMinimum() async {
    final db = await database;
    final List<dynamic> results = db!;

    return results;
  }

  Future<List<dynamic>> getMaximum() async {
    final db = await database;
    final List<dynamic> results = db!;

    return results;
  }
}
