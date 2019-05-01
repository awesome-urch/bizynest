import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:bizynest/models/enums.dart';
import 'package:bizynest/containers/counter/increase_counter.dart';
import 'package:bizynest/containers/counter/counter.dart';
import 'package:bizynest/containers/auth_button/login_button_container.dart';
import 'package:bizynest/models/app_state.dart';
import 'package:bizynest/actions/auth_actions.dart';
import 'package:bizynest/pages/create_account.dart';
import 'package:bizynest/widgets/common_widgtes.dart';
import 'package:bizynest/pages/forgot_password.dart';


// One simple action: Increment
//enum Actions { Increment }

class LoginPage extends StatelessWidget {
  final String title;
  //final Store<int> store;

  LoginPage({Key key, this.title, }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  /*@override
  _LoginPageState createState() => _LoginPageState();*/

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    CommonWidgets commonWidgets = new CommonWidgets(context: context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    const EdgeInsets edgeInsets = EdgeInsets.fromLTRB(32.0, 24.0, 32.0, 24.0);

    /*Widget _buildButtonMaterial({String label, Color color, VoidCallback callback}){
      return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(0.0),
        color: color,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: callback,
          child: Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
        ),
      );
    }*/

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
      child: InkWell(
        onTap: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              // builder methods always take context!
              builder: (context) {
                return ForgotPasswordPage();
              },
            ),
          );
        },
        child: Text(
          'Forgot your password?',
          softWrap: true,
          style: TextStyle(color: Colors.grey[300]),
        ),
      )
    );

    Widget userNameInputField = Container(
      padding: edgeInsets,
      child: TextField(
          style: TextStyle(color: Colors.white),
          //obscureText: true,
          controller: usernameController,
          //onChanged: (v) => usernameController.text = v,
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
          controller: passwordController,
          //onChanged: (v) {
            //passwordController.text = v;
            //print(v);
          //},
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

    void _testFn(){
      print(30);
    }

    void _checkInputs(BuildContext context){
      if(usernameController.text.isEmpty){
        Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('Enter your username'),
          ),
        );
        return;
      }
      if(passwordController.text.isEmpty){
        Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('Enter your password'),
          ),
        );
        return;
      }

      void toRegister(){
        // Navigator.of(context) accesses the current app's navigator.
        // Navigators can 'push' new routes onto the stack,
        // as well as pop routes off the stack.
        //
        // This is the easiest way to build a new page on the fly
        // and pass that page some state from the current page.
        Navigator.of(context).push(
          MaterialPageRoute(
            // builder methods always take context!
            builder: (context) {
              return CreateAccountPage();
            },
          ),
        );
      }



    }

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
              child: new AuthButtonContainer(
                username: usernameController.text,
                password: passwordController.text,
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 24.0),
                child: orSection
            ),
            Container(
              margin: edgeInsets,
              //child: _buildButtonMaterial(label:'Create Account', color: new Color(0xff1565c0), callback: () {
              //      () async => print(20);
              //}),
              child: commonWidgets.buildButtonMaterial(
                  label:'Create Account',
                  color: new Color(0xff1565c0),
                  callback:
                    () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          // builder methods always take context!
                          builder: (context) {
                            return CreateAccountPage();
                          },
                        ),
                      );
                  }
              ),
            ),
            // Connect the Store to a Text Widget that renders the current
            // count.
            //
            // We'll wrap the Text Widget in a `StoreConnector` Widget. The
            // `StoreConnector` will find the `Store` from the nearest
            // `StoreProvider` ancestor, convert it into a String of the
            // latest count, and pass that String  to the `builder` function
            // as the `count`.
            //
            // Every time the button is tapped, an action is dispatched and
            // run through the reducer. After the reducer updates the state,
            // the Widget will be automatically rebuilt with the latest
            // count. No need to manually manage subscriptions or Streams!
            //new Counter(),
            // Connect the Store to a FloatingActionButton. In this case, we'll
            // use the Store to build a callback that will dispatch an Increment
            // Action.
            //
            // Then, we'll pass this callback to the button's `onPressed` handler.
          ],
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.

        ),
      ),
      //floatingActionButton: new IncreaseCountButton(),
    );
  }
}


/*
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
            // Connect the Store to a Text Widget that renders the current
            // count.
            //
            // We'll wrap the Text Widget in a `StoreConnector` Widget. The
            // `StoreConnector` will find the `Store` from the nearest
            // `StoreProvider` ancestor, convert it into a String of the
            // latest count, and pass that String  to the `builder` function
            // as the `count`.
            //
            // Every time the button is tapped, an action is dispatched and
            // run through the reducer. After the reducer updates the state,
            // the Widget will be automatically rebuilt with the latest
            // count. No need to manually manage subscriptions or Streams!
            StoreConnector<int, String>(
              converter: (store) => store.state.toString(),
              builder: (context, count) {
                return new Text(
                  count,
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
      // Connect the Store to a FloatingActionButton. In this case, we'll
      // use the Store to build a callback that will dispatch an Increment
      // Action.
      //
      // Then, we'll pass this callback to the button's `onPressed` handler.
          ],
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.

        ),
      ),
      floatingActionButton: new StoreConnector<int, VoidCallback>(
        converter: (store) {
          // Return a `VoidCallback`, which is a fancy name for a function
          // with no parameters. It only dispatches an Increment action.
          return () => store.dispatch(Actions.Increment);
        },
        builder: (context, callback) {
          return new FloatingActionButton(
            // Attach the `callback` to the `onPressed` attribute
            onPressed: callback,
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          );
        },
      ),
    );
  }
}
*/