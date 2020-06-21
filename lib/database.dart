import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'taskModel.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper db = DatabaseHelper._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _createDatabase();
    return _database;
  }

  Future<Database> _createDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), 'task.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTO_INCREMENT , title TEXT, description TEXT, dateTime TEXT)",
      );
    }, version: 1);
  }

//   tasks() async {
  
//   final Database db = await database;
//    List<Map> maps = await db.query('tasks');
//    return maps;
//   //maps.forEach((row) => print(row));
//   // return List.generate(maps.length, (i) {
//   //   return Task(
//   //    // id: maps[i]['id'],
//   //     title: maps[i]['title'],
//   //     description: maps[i]['description'],
//   //     dateTime:maps[i]['dateTime'],
//   //   );
//   // });
  
// }
Future<List<Task>> tasks() async {
  // Get a reference to the database.
  final Database db = await database;

  // Query the table for all The Dogs.
  final maps = await db.query('tasks');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Task(
      id: maps[i]['id'],
      title: maps[i]['title'],
      description: maps[i]['description'],
      dateTime: maps[i]['dateTime']
    );
  });
}



Future<void> insertTask(Task task) async {
  final db = await database;


  await db.insert(
    'tasks',
    task.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
}
