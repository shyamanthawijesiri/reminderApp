import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reminder_app/allTask.dart';

import './addTask.dart';

void main() => runApp(MyApp());

// class MyApp extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _MyAppState();
//   }

// }

class MyApp extends StatelessWidget{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
     // home: AllTaskPage(),

      
      routes: {
        '/':(BuildContext context) => AllTaskPage(),
        '/addTask': (BuildContext context) => AddTaskPage(),
      },
     
    );
  }
}
