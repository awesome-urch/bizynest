import 'package:flutter/material.dart';
import 'package:bizynest/widgets/common_widgtes.dart';
import 'package:bizynest/constants.dart';

class HomePage extends StatefulWidget {
  final String title;

  //final Store<int> store;

  HomePage({Key key, this.title,}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Home Page'),
      ),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                padding: EdgeInsets.fromLTRB(32.0, 48.0, 32.0, 24.0),
                child:Image.asset(
                  "assets/logo_extended.png",
                  fit: BoxFit.contain,
                ),
              ),
              decoration: BoxDecoration(
                // Box decoration takes a gradient
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.7],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.

                    new Color(0xFF601183),
                    new Color(0x88601183),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Recent Posts'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}