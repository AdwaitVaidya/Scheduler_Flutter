import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler_flutter/taskCard.dart';

class EditTask extends StatelessWidget {
  TaskCard currentTask;

  EditTask({TaskCard currentTask}) {
    if (currentTask == null) {
      currentTask = new TaskCard();
    } else {
      this.currentTask = currentTask;
    }
  }

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    String notes = "";
    if(currentTask.taskNotes != null){
      var iter = currentTask.taskNotes.iterator;
      while(iter.moveNext()){
        notes += iter.current;
      }
    }
    else{
      notes = "";
    }
    final myController = TextEditingController();

    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Flexible(
            flex: 1,
            child: TextFormField(

              controller: myController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
          ),
          Flexible(
              flex: 1,
              child: Text("Date and Time : ${currentTask.taskCreated.toString()}")
          ),
          Flexible(
            flex: 13,
            child: TextFormField(
            controller: myController,
            decoration: InputDecoration(
            ),

          ))
          ]
        )
    );
  }
}
