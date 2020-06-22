import 'package:flutter/material.dart';
import 'package:reminder_app/taskModel.dart';
import 'package:reminder_app/widget/task-widget.dart';
import './database.dart';
import 'addTask.dart';

class AllTaskPage extends StatelessWidget{

   final Future<List<Task>> _alltasks;
   AllTaskPage(this._alltasks);
 // AllTaskPage(this._tasks)
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
     appBar: AppBar(
        title: const Text('All Tasks'),
      ),
      body: TaskDisplay(_alltasks),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>AddTaskPage()));
        },
       
        child: const Icon(Icons.add),
      ),
    );
  }
}