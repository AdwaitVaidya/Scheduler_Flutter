import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler_flutter/taskCard.dart';

class NavigationToday extends StatelessWidget {
  // This widget is the root of your application.
  final todaysTaskCards = [
    new TaskCard(
      taskID: "10",
      taskTitle: "First Task of Today",
      taskCreated: DateTime.now(),
    ),
    new TaskCard(
        taskID: "12",
        taskTitle: "Second Task of Today",
        taskCreated: DateTime.now()),
    new TaskCard(
        taskID: "13",
        taskTitle: "Third Task of Today",
        taskCreated: DateTime.now()),
    new TaskCard(
        taskID: "14",
        taskTitle: "Fourth Task of Today",
        taskCreated: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: todaysTaskCards.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Text(todaysTaskCards[index].taskID),
                Text(todaysTaskCards[index].taskTitle),
                Text(todaysTaskCards[index].taskCreated.toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}

