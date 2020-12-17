import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../taskCard.dart';

class NavigationMonth extends StatelessWidget {
  // This widget is the root of your application.
  final todaysTaskCards = [
    new TaskCard(
      taskID: "5",
      taskTitle: "First Task of Month",
      taskCreated: DateTime.now(),
    ),
    new TaskCard(
        taskID: "6",
        taskTitle: "Second Task of Month",
        taskCreated: DateTime.now()),
    new TaskCard(
        taskID: "7",
        taskTitle: "Third Task of Month",
        taskCreated: DateTime.now()),
    new TaskCard(
        taskID: "8",
        taskTitle: "Fourth Task of Month",
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

