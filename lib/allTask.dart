import 'package:flutter/material.dart';
import 'package:reminder_app/taskModel.dart';

class AllTaskPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
     appBar: AppBar(
        title: const Text('All Tasks'),
      ),
      body: Task(),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.pushReplacementNamed(context,'/addTask');
        },
       
        child: const Icon(Icons.add),
      ),
    );
  }
}