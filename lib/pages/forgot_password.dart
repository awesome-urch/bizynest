import 'package:flutter/material.dart';
import 'package:bizynest/widgets/common_widgtes.dart';
import 'package:bizynest/constants.dart';
import 'package:bizynest/pages/login_page.dart';
import 'package:bizynest/services/rest_api.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:bizynest/models/post_model.dart';
import 'package:bizynest/services/rest_api.dart';
import 'package:bizynest/helpers/validator_methods.dart';

class ForgotPasswordPage extends StatefulWidget {
  final String title;

  //final Store<int> store;

  ForgotPasswordPage({Key key, this.title,}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();

}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>{

  String _email = "";
  final emailController = TextEditingController();
  int _error = 0;
  bool _emailError = false;
  bool _processing = false;

  Future<String> createPost(Post post) async{
    print('processing');
    setState(() {
      _processing = true;
    });

    final response = await http.post(RestApi.REST_URL_POST,  //https://jsonplaceholder.typicode.com/posts //RestApi.REST_URL_POST
        headers: {
          //HttpHeaders.contentTypeHeader: 'application/json'

        },
        //encoding: Utf8Codec(allowMalformed: true),
        body: postToJson(post)
    );

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
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    CommonWidgets commonWidgets = new CommonWidgets(context: context);

    const EdgeInsets edgeInsets = EdgeInsets.fromLTRB(32.0, 24.0, 32.0, 24.0);

    _process(BuildContext ctx){

      /*return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has typed in using our
            // TextEditingController
            content: Text(emailController.text),
          );
        },
      );*/

      if(emailController.text.isEmpty){
        return;
      }

      if(!isValidEmail(emailController.text)){
        setState(() {
          _emailError = true;
        });
        return;
      }else{
        setState(() {
          _emailError = false;
        });
      }

      setState(() {
        _error = 3;
      });

      Post post = Post(request: "forgot_password",email: emailController.text);
      createPost(post).then((response){

        print('api response is: $response');

        if(response == 'error'){

          final snk = commonWidgets.buildSnackBar(
              action: true,
              text: 'An error occurred',
              actionLabel: 'Retry',
              callback: () async {
                _process(ctx);
              }
            );
          Scaffold.of(ctx).showSnackBar(snk);

          /*final snackBar = SnackBar(
            content: Text('An error occurred'),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () {
                // Some code to undo the change!
                _process(ctx);
              },
            ),
          );

          Scaffold.of(context).showSnackBar(snackBar);*/
        }else{
          Map map = jsonDecode(response);
          var obj = new ApiResponse.fromJson(map);

          if(obj.error == 0){

            final snk = commonWidgets.buildSnackBar(action: false,text: 'A password reset link has been sent to your email address');
            Scaffold.of(ctx).showSnackBar(snk);
            Navigator.of(context).push(
              MaterialPageRoute(
                // builder methods always take context!
                builder: (context) {
                  return LoginPage();
                },
              ),
            );
          }

          if(obj.error == 1){
            final snk = commonWidgets.buildSnackBar(action: false,text: 'Email does not exist in our records');
            Scaffold.of(ctx).showSnackBar(snk);
          }
          if(obj.error == 2){
            final snk = commonWidgets.buildSnackBar(action: false,text: 'An error occurred');
            Scaffold.of(ctx).showSnackBar(snk);
          }
        }

//      if(response.statusCode > 200)
//          print(response.body);
//        else
//          print(response.statusCode);
      }).catchError((error){
        print('error : $error');

      });

    }

    Widget textIntroSection = Container(
      padding: edgeInsets,
      child: Text(
        'Enter your email address and proceed',
        softWrap: true,
        style: TextStyle(color:Colors.white,fontSize: 20.0),
      ),
    );

    Widget _inputText({String hint, TextEditingController controller, bool obscure, TextInputType inputType, String errTxt}){
      return TextField(
          style: TextStyle(color: Colors.white),
          obscureText: (obscure==null)?false:obscure,
          controller: controller,
          keyboardType: inputType,
          //onChanged: (v) => usernameController.text = v,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[500]),
            errorText: errTxt,
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
          )
      );
    }

    Widget emailInputField = Container(
      padding: edgeInsets,
      child: _inputText(hint: 'Email',obscure: false, controller: emailController, inputType: TextInputType.emailAddress, errTxt: _emailError?'Enter a valid email address':null ),
    );

    Widget btn2 = Builder(
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
              child: Text('Proceed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
            ),
          );
        }
    );

    /*Widget stack1 = Stack(
      children: <Widget>[
        Center(
          child: FlatButton(
              onPressed: handleSignIn,
              child: Text(
                'SIGN IN WITH GOOGLE',
                style: TextStyle(fontSize: 16.0),
              ),
              color: Color(0xffdd4b39),
              highlightColor: Color(0xffff7f7f),
              splashColor: Colors.transparent,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0)),
        ),

        // Loading
        Positioned(
          child: isLoading
              ? Container(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(themeColor),
              ),
            ),
            color: Colors.white.withOpacity(0.8),
          )
              : Container(),
        ),
      ],
    );*/

    Widget stack1 = Stack(
      children: <Widget>[
        Container(
          child: ListView(  //it is from here o actually
            children: <Widget>[
              textIntroSection,
              emailInputField,
              Container(
                margin: edgeInsets,
                //child: _buildButtonMaterial(context: context, label: 'Complete Registration',color: new Color(0xff1565c0)), //new Color(0xff1565c0)
                /*child: commonWidgets.buildButtonMaterial(
                    label: 'Proceed',
                    color: AppConstants.appBlue,
                    callback:
                        () async {
                          _process();

                    }

                    ),*/
                child: btn2,

              ),
              //loader,
            ],
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
        appBar: AppBar(
          // Here we take the value from the LoginPage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Forgot Password'),
        ),
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
          child: stack1,
        )
    );
  }
}