import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler_flutter/EditTask.dart';
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
          return StreamBuilder(
            stream: FirebaseFirestore.instance.collection('First').doc('FirstTask').snapshots(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                  var taskData = snapshot.data;
                  if(taskData.exists){
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
                                Text(taskData['Title'], textAlign: TextAlign.center),
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
                }
              }

              return Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }
}

