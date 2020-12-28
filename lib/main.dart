import 'package:flutter/material.dart';
import 'package:scheduler_flutter/EditTask.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scheduler_flutter/NavigaionBar/navigationMonth.dart';
import 'package:scheduler_flutter/NavigaionBar/navigationWeek.dart';
import 'package:scheduler_flutter/NavigaionBar/navigationToday.dart';





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      NavigationToday(),
      NavigationWeek(),
      NavigationMonth()
    ];
    final _kBottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(Icons.account_box_outlined), label: "Day"),
      const BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "Week"),
      const BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Month")
    ];

    assert(_kTabPages.length == _kBottomNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottomNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
        actions: [
          FlatButton(
              onPressed: () {
                EditTask();
              },
              child: Icon(Icons.add))
        ],
      ),
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
