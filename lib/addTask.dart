import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddTaskPage extends StatelessWidget {

final dateFormat = DateFormat("yyyy-MM-dd");
final timeFormat = DateFormat("HH:mm");

Widget _taskTitleFormField(){
  return  TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'title is required';
              }
            },
             decoration: InputDecoration(labelText: 'Product title')
          );
}

Widget _taskDescriptionFormField(){
  return  TextFormField(
             decoration: InputDecoration(labelText: 'Product Decription')
          );
}


Widget _taskDatePicker(){
   return 
      DateTimeField(
        decoration: InputDecoration(labelText: 'Date'),
        format: dateFormat,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      );
    
}

Widget _taskTimePicker(){
  return   DateTimeField(
        decoration: InputDecoration(labelText: 'Time'),
        format: timeFormat,
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.convert(time);
        },
      );
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Tasks'),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Form(
          child: Column(children: <Widget>[
            _taskTitleFormField(),
            _taskDescriptionFormField(),
            _taskDatePicker(),
            _taskTimePicker(),
            SizedBox(
              height: 10.0
            ),
            RaisedButton(
                    child: Text('Save'),
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    onPressed: (){},
                    )
          ]),
        ),
      ),
    );
  }
}