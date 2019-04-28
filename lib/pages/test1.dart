import 'package:flutter/material.dart';

/*

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final userNameField = TextField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20.0),
          hintText: "Username"
      ),
    );

    final passwordField = TextField(
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
        )
    );

    final belowLogoText = Text("Log in to get in touch with exotic businesses around you",
      style: TextStyle(
        color: Colors.white,
      ),
    );

    final forgotPassword = Text("Forgot your password?",
      style: TextStyle(
        color: Colors.white30,
      ),
      textAlign: TextAlign.start,
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(0.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
      ),
    );

    Material _buildButtonMaterial(String label, Color color){
      return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(0.0),
        color: color,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {},
          child: Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
        ),
      );
    }

    Widget textIntroSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Log in to get in touch with exotic businesses around you. ',
        softWrap: true,
      ),
    );

    Widget forgotPwd = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Forgot your password ',
        softWrap: true,
      ),
    );

    Widget userNameInputField = Container(
      padding: const EdgeInsets.all(32),
      child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Username",
          )
      ),
    );

    Widget passwordInputField = Container(
      padding: const EdgeInsets.all(32),
      child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
          )
      ),
    );



    return Scaffold(

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          //color: Colors.white,
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
          padding: const EdgeInsets.all(36.0),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                */
/*height: 100.0,*//*

                child: Image.asset(
                  "assets/logo_extended.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20.0),
              belowLogoText,
              SizedBox(height: 20.0),
              userNameField,
              SizedBox(height: 25.0),
              passwordField,
              SizedBox(
                height: 25.0,
              ),
              forgotPassword,
              SizedBox(
                height: 25.0,
              ),
              loginButon,
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

        ),
      ),
    );
  }
}*/
