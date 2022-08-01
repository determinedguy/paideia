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

  Future<List<Map<String, dynamic>>> getStudentList() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!;

    return results;
  }

  Future<int> insertWatchlist(MovieTable movie) async {
    final db = await database;
    return await db!.insert(_tblWatchlist, movie.toJson());
  }

  Future<int> removeWatchlist(MovieTable movie) async {
    final db = await database;
    return await db!.delete(
      _tblWatchlist,
      where: 'id = ?',
      whereArgs: [movie.id],
    );
  }

  Future<Map<String, dynamic>?> getMovieById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblWatchlist,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlistMovies() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblWatchlist);

    return results;
  }
}
