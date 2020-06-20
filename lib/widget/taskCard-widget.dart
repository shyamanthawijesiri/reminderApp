import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Map<String, dynamic> tasks;
  final int index;
  TaskCard(this.tasks, this.index);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: Column(
      children: <Widget>[
        
        Text(tasks['title']),
        
        ],
    ));
  }
}
