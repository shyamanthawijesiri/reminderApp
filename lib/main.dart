import 'package:flutter/material.dart';
import './task.dart';
import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
       home: HomePage(),
    
      routes: {
       // '/': (BuildContext context) => HomePage(),
        '/task': (BuildContext context) => TaskPage(),
      },
    );
  }
}
