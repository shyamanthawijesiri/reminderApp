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

  tasks() async {
  
  final Database db = await database;
   List<Map> maps = await db.query('tasks');
  maps.forEach((row) => print(row));
  // return List.generate(maps.length, (i) {
  //   return Task(
  //    // id: maps[i]['id'],
  //     title: maps[i]['title'],
  //     description: maps[i]['description'],
  //     dateTime:maps[i]['dateTime'],
  //   );
  // });
  
}

void foo() async {
  final user = await tasks();
  print(user);
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
