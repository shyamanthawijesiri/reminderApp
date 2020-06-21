import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reminder_app/allTask.dart';
import 'package:reminder_app/database.dart';

import './addTask.dart';
import 'taskModel.dart';

void main(){
WidgetsFlutterBinding.ensureInitialized();
runApp(MyApp());
} 

// class MyApp extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _MyAppState();
//   }

// }

class MyApp extends StatelessWidget{
  // This widget is the root of your application.
  final Future<List<Task>> _allTask = DatabaseHelper.db.tasks();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
     // home: AllTaskPage(),

      
      routes: {
        '/':(BuildContext context) => AllTaskPage(_allTask),
        '/addTask': (BuildContext context) => AddTaskPage(),
      },
     
    );
  }
}
