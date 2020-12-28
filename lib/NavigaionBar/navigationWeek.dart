import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler_flutter/EditTask.dart';

import '../taskCard.dart';

class NavigationWeek extends StatelessWidget {
  // This widget is the root of your application.
  final todaysTaskCards = [
    new TaskCard(
      taskID: "1",
      taskTitle: "First Task of Week",
      taskCreated: DateTime.now(),
      taskNotes: ["All","B","Taken"]
    ),
    new TaskCard(
        taskID: "2",
        taskTitle: "Second Task of Week",
        taskCreated: DateTime.now(),
        taskNotes: ["There are some task","Before this task","C"]
    ),
    new TaskCard(
        taskID: "3",
        taskTitle: "Third Task of Week",
        taskCreated: DateTime.now(),
        taskNotes: ["E","G","H"]
    ),
    new TaskCard(
        taskID: "4",
        taskTitle: "Fourth Task of Week",
        taskCreated: DateTime.now(),
      taskNotes: ["Z","Y","Well"]
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(

        itemCount: todaysTaskCards.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            child: Dismissible(
                key: ValueKey(todaysTaskCards[index].taskID),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {},
                confirmDismiss: (direction) async {
                  final result = await showDialog(
                      context: context, builder: (_) => EditTask());
                  print(result);
                  return result;
                },
                background: Container(
                  color: Colors.red,
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    child: Icon(Icons.delete, color: Colors.white),
                    alignment: Alignment.center,
                  ),
                ),
                  child: GestureDetector(
                  child: Column(
                    children: [
                      Text(todaysTaskCards[index].taskID, textAlign: TextAlign.center),
                      Text(todaysTaskCards[index].taskTitle, textAlign: TextAlign.center),
                      Text(todaysTaskCards[index].taskCreated.toString(), textAlign: TextAlign.center),
                    ],
                  ),
                  onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => new EditTask(currentTask: todaysTaskCards[index]) ));
                  },
                )
            ),
          );
        },
      ),
    );
  }
}
