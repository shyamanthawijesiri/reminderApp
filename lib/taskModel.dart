import 'package:sqflite/sqflite.dart';

class Task {
  final String id;
  final String title;
  final String description;
  final String dateTime;

  Task({this.id, this.title, this.description, this.dateTime});

  
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'descrption': description,
      'dateTime': dateTime,
    };
  }

 
}