


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class AddTask extends StatefulWidget {
  @override 
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
