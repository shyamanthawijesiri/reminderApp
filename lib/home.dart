import 'package:flutter/material.dart';


// class HomePage extends StatefulWidget{

//  @override
//   State<StatefulWidget> createState() {

//     return _HomePageState();
//   }
// }

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      appBar: AppBar(
        title: Text('My Task'),
      ),
      body: Center(child: Text("This is Home Page"),),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
         Navigator.of(context)
            .pushReplacementNamed('/task');
        
      },
      child: const Icon(Icons.add),
      )
    )
  ;
  }
}