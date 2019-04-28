import 'package:flutter/material.dart';


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

    const EdgeInsets edgeInsets = EdgeInsets.fromLTRB(32.0, 24.0, 32.0, 24.0);

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
      padding: edgeInsets,
      child: Text(
        'Log in to get in touch with exotic businesses around you. ',
        softWrap: true,
        style: TextStyle(color:Colors.white),
      ),
    );

    Widget forgotPwd = Container(
      padding: edgeInsets,
      child: Text(
        'Forgot your password?',
        softWrap: true,
        style: TextStyle(color: Colors.grey[300]),
      ),
    );

    Widget userNameInputField = Container(
      padding: edgeInsets,
      child: TextField(
          style: TextStyle(color: Colors.white),
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Username",
            hintStyle: TextStyle(color: Colors.grey[300]),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
          )
      ),
    );

    Widget passwordInputField = Container(
      padding: edgeInsets,
      child: TextField(
          style: TextStyle(color: Colors.white),
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.grey[300]),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
          )
      ),
    );

    Widget orSection = Row(
        children: <Widget>[
          Expanded(
              child: Divider(color: Colors.grey[300],)
          ),

          Container(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Text("OR", style: TextStyle(color:Colors.white,)),
          ),

          Expanded(
              child: Divider(color: Colors.grey[300],)
          ),
        ]
    );



    return Scaffold(
      /*appBar: AppBar(
        // Here we take the value from the LoginPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),*/
      body: Container(
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
        child:ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(32.0, 48.0, 32.0, 24.0),
              child:Image.asset(
                "assets/logo_extended.png",
                fit: BoxFit.contain,
              ),
            ),
            textIntroSection,
            userNameInputField,
            passwordInputField,
            forgotPwd,
            Container(
              margin: edgeInsets,
              child: _buildButtonMaterial('Login', new Color(0xff1565c0)),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 24.0),
              child: orSection
            ),
            Container(
              margin: edgeInsets,
              child: _buildButtonMaterial('Create Account', new Color(0xff1565c0)),
            ),
          ],
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.

        ),
      )
    );
  }
}