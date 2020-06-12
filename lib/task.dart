import 'package:flutter/material.dart';

// class TaskPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _TaskPageState();
//   }
// }

class TaskPage extends StatelessWidget {
  Widget _taskNameTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'What do people call you?',
        labelText: 'Name *',
      ),
      onSaved: (String value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      // validator: (String value) {
      //   return value.contains('@') ? 'Do not use the @ char.' : null;
      // },
    );
  }

  Widget _taskDescriptionField() {}
  _taskTime() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      // appBar: AppBar(
      //   title: Text('Create Task'),
      // ),
      child: Center(child: Form(
        //  key: _formKey,
        child: ListView(
            children: <Widget>[_taskNameTextField(), ]),
      ),
    ),);
  }
}
