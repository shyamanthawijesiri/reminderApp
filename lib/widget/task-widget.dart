import 'package:flutter/material.dart';
import 'package:reminder_app/widget/taskCard-widget.dart';

class Task extends StatelessWidget{

  final List<Map<String, dynamic>> tasks;
  Task(this.tasks);

  Widget _buildTaskList(){
    Widget taskCard;
    if(tasks.length>0){
         taskCard = ListView.builder(itemBuilder: (BuildContext context, int index){
      TaskCard(tasks[index], index);
    },
    itemCount: tasks.length,
    );
    }else{
      taskCard = Center(child: Text('No Task'));
    }

    return taskCard;

   
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildTaskList();
  }
}