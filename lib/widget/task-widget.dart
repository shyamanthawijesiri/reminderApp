import 'package:flutter/material.dart';
import '../database.dart';
import 'package:reminder_app/widget/taskCard-widget.dart';

import '../taskModel.dart';

class TaskDisplay extends StatelessWidget{

   final Future<List<Task>> _allTasks;


  TaskDisplay(this._allTasks);

  Widget _buildTaskList(){
 
     return FutureBuilder(future: _allTasks,
     builder: (BuildContext context,AsyncSnapshot<List<Task>> snapshot){
       print(snapshot.data);
       if(!snapshot.hasData){

        print("no chlide");
        return Text("no Child");
       }
       if(snapshot.data.length == 0){
        print("no record");
        return Text("no record");
       }
    

       return ListView.builder(
         itemCount: snapshot.data.length,
         itemBuilder: (BuildContext context, int index){
         List<Task> task = snapshot.data.toList();
         print(task[0].id);
         return Column(
           children: <Widget>[
            
             ListTile(
               
               title:Text(task[index].title) ,
               subtitle: Text(task[index].description+"  "+ task[index].dateTime),
               
             ),
             Divider()
           ],

         );

        
       });
     },
    
    
    );
   
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildTaskList();
  }
}