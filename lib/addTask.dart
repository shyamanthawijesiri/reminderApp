import 'package:flutter/material.dart';

import 'package:flutter_datetime_formfield/flutter_datetime_formfield.dart';
import 'package:reminder_app/taskModel.dart';
import './database.dart';
import 'package:intl/intl.dart';

import 'package:reminder_app/database.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class AddTaskPage extends StatefulWidget {
  final initialDateTime = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTaskPage> {
  static DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final Map<String, dynamic> _taskData = {
    'title': null,
    'description': null,
    'dateTime': null
  };

  // final DateTime initialDateTime;

  //AddTaskPage({this.initialDateTime});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _taskTitleFormField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'title is required';
        }
      },
      decoration: InputDecoration(labelText: 'Task title'),
      onSaved: (String value) {
        _taskData['title'] = value;
      },
    );
  }

  Widget _taskDescriptionFormField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Task Decription'),
      onSaved: (String value) => _taskData['description'] = value,
    );
  }

  Widget _taskDateTimePicker() {
    return DateTimeFormField(
        initialValue: widget.initialDateTime,
        label: "Date Time",
        validator: (DateTime dateTime) {
          if (dateTime == null) {
            return "Date Time Required";
          }
          return null;
        },
        onSaved: (DateTime dateTime) {
          String dT = dateFormat.format(dateTime);
          _taskData['dateTime'] = dT;
        });
  }

  void _submitForm() {
    _formKey.currentState.validate();
    _formKey.currentState.save();
    print(_taskData);
    //  Navigator.pushReplacementNamed(context, '/');
    final newTask = Task(
        title: _taskData['title'],
        description: _taskData['description'],
        dateTime: _taskData['dateTime']);
    print('hellooooooooooooo');
    //FlutterRingtonePlayer.playAlarm();
    //print(newTask.toMap());

    //DatabaseHelper.db.insertTask(newTask);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create a Tasks'),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: ListView(children: <Widget>[
              _taskTitleFormField(),
              _taskDescriptionFormField(),
              _taskDateTimePicker(),
              SizedBox(height: 10.0),
              RaisedButton(
                child: Text('Save'),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: () {
                  FlutterRingtonePlayer.playNotification();
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
