import 'package:bizynest/models/post_model.dart';
import 'package:bizynest/pages/home.dart';
import 'package:bizynest/services/rest_api.dart';
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
import 'package:bizynest/helpers/validator_methods.dart';
import 'package:bizynest/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:bizynest/constants.dart';

// One simple action: Increment
//enum Actions { Increment }

class LoginPage extends StatefulWidget {
  final String title;

  //final Store<int> store;

  LoginPage({Key key, this.title, }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  /*@override
  _LoginPageState createState() => _LoginPageState();*/
}


class _LoginPageState extends State<LoginPage> {

  bool _processing = false;
  bool _nameError = false;
  bool _nameEmpty = false;
  bool _pwdEmpty = false;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<String> createPost(http.Client client) async{

    setState(() {
      _processing = true;
    });

    final response = await http.get(RestApi.REST_URL_GET + "?request=login&username=" + usernameController.text + "&password=" + passwordController.text);

    setState(() {
      _processing = false;
    });

    //String s = jsonEncode(response.body);
    //print('res: '+response.body);
    //return postFromJson(response.body);
    return response.body;
    //return json.decode(response.body);
    //return json.decode(s);
  }


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

    _process(BuildContext ctx) {
      if (usernameController.text.isEmpty) {
        setState(() {
          _nameEmpty = true;
        });
        return;
      }else{
        setState(() {
          _nameEmpty = false;
        });
      }
      if (passwordController.text.isEmpty) {
        setState(() {
          _pwdEmpty = true;
        });
        return;
      }else{
        setState(() {
          _pwdEmpty = false;
        });
      }

      createPost(http.Client()).then((response){

        print('api brought $response');

        Map map = jsonDecode(response);
        //var obj = new ApiResponse.fromJson(map);
        int err = map['error'];

        if(err == 0){

          String d = map['data']['surname'];
          print(d);

          Navigator.of(context).push(
            MaterialPageRoute(
              // builder methods always take context!
              builder: (context) {
                return HomePage();
              },
            ),
          );

        }else{
          final snk = commonWidgets.buildSnackBar(action: false,text: 'Invalid username or password');
          Scaffold.of(ctx).showSnackBar(snk);
        }

      }).catchError((error){

        setState(() {
          _processing = false;
        });

        print('error : $error');

        final snk = commonWidgets.buildSnackBar(action: false,text: 'An error occurred');
        Scaffold.of(ctx).showSnackBar(snk);

      });
    }

    void _testFn(){
      print(30);
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
            hintStyle: TextStyle(color: Colors.grey[500]),
            errorText: _nameEmpty?'Enter your username':null,
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
            hintStyle: TextStyle(color: Colors.grey[500]),
            errorText: _pwdEmpty?'Enter your password':null,
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

    Widget loginBtn = Builder(
      // Create an inner BuildContext so that the onPressed methods
      // can refer to the Scaffold with Scaffold.of().
        builder: (BuildContext context) {
          return Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(0.0),
            color: AppConstants.appBlue,
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: ()=>_process(context),
              /*onPressed: (){
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Have a snack!'),
                  ),
                );
              },*/
              child: Text('Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
            ),
          );
        }
    );

    Widget stack1 = Stack(
      children: <Widget>[
        Container(
          child: ListView(
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
                child: loginBtn,
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

            ],
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.

          ),
        ),

        // Loading
        Positioned(
          child: _processing
              ? Container(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
              ),
            ),
            color: Colors.white.withOpacity(0.8),
          )
              : Container(),
        ),
      ],
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
        child:stack1,
      ),
      //floatingActionButton: new IncreaseCountButton(),
    );
  }
}
