import 'package:flutter/material.dart';

class AllTaskPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
     appBar: AppBar(
        title: const Text('All Tasks'),
      ),
      body: Center(child: Text("all TAsk")),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.pushReplacementNamed(context,'/addTask');
        },
       
        child: const Icon(Icons.add),
      ),
    );
  }
}