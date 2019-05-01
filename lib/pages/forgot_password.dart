import 'package:flutter/material.dart';
import 'package:bizynest/widgets/common_widgtes.dart';
import 'package:bizynest/constants.dart';
import 'package:bizynest/pages/login_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  final String title;

  //final Store<int> store;

  ForgotPasswordPage({Key key, this.title,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CommonWidgets commonWidgets = new CommonWidgets(context: context);

    const EdgeInsets edgeInsets = EdgeInsets.fromLTRB(32.0, 24.0, 32.0, 24.0);

    Widget textIntroSection = Container(
      padding: edgeInsets,
      child: Text(
        'Enter your email address and proceed',
        softWrap: true,
        style: TextStyle(color:Colors.white,fontSize: 20.0),
      ),
    );

    Widget _inputText({String hint, TextEditingController controller, bool obscure}){
      return TextField(
          style: TextStyle(color: Colors.white),
          obscureText: (obscure==null)?false:true,
          controller: controller,
          //onChanged: (v) => usernameController.text = v,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[300]),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
          )
      );
    }

    Widget emailInputField = Container(
      padding: edgeInsets,
      child: _inputText(hint: 'Email',obscure: false, ),
    );




    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the LoginPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Forgot Paasword'),
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
      child: ListView(
        children: <Widget>[
          textIntroSection,
          emailInputField,
          Container(
            margin: edgeInsets,
            //child: _buildButtonMaterial(context: context, label: 'Complete Registration',color: new Color(0xff1565c0)), //new Color(0xff1565c0)
            child: commonWidgets.buildButtonMaterial(
                label: 'Proceed',
                color: AppConstants.appBlue),
          ),
        ],
      ),
    )
    );
  }

}