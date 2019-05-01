import 'package:flutter/material.dart';
import 'package:bizynest/widgets/common_widgtes.dart';
import 'package:bizynest/constants.dart';
import 'package:bizynest/pages/login_page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:bizynest/models/category_model.dart';
import 'package:bizynest/widgets/list_category.dart';

Future<List<MyCategory>> fetchPosts(http.Client client) async {
  //https://jsonplaceholder.typicode.com/photos
  //https://bizynest.com/api/src/routes/process_one.php?request=categories
  //http://192.168.0.100/pagesn/process_one.php?request=categories2
  final response = await client.get('http://192.168.0.100/pagesn/process_one.php?request=categories');

  //print(response.body);
  final body = json.decode(response.body);
  /*print(body['data']);

  if(body['data']){
    final String data = body['data'];
  }*/


  //print(body['data'].toString());
  //return compute(parsePosts, response.body);
  return compute(parsePosts, jsonEncode(body['data']));
}

List<MyCategory> parsePosts(String responseBody) {

  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<MyCategory>((json) => MyCategory.fromJson(json)).toList();
}

/*From Doc*/
Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
  await client.get('https://jsonplaceholder.typicode.com/photos');

  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>
List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}


class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}



class CreateAccountPage extends StatelessWidget{
  final String title;
  //final Store<int> store;

  CreateAccountPage({Key key, this.title, }) : super(key: key);

  List<DropdownMenuItem<int>> stateList = [];

  void loadStateList() {
    stateList = [];
    stateList.add(new DropdownMenuItem(
      child: new Text('Abuja'),
      value: 0,
    ));
    stateList.add(new DropdownMenuItem(
      child: new Text('Abia'),
      value: 1,
    ));
    stateList.add(new DropdownMenuItem(
      child: new Text('Adamawa'),
      value: 2,
    ));
  }

  int _selectedState = 0;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    loadStateList();

    CommonWidgets commonWidgets = new CommonWidgets(context: context);

    const EdgeInsets edgeInsets = EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 20.0);

    Widget _inputText({String hint, TextEditingController controller, bool obscure}){
      return TextField(
          style: TextStyle(color: Colors.white),
          obscureText: obscure,
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

    Widget firstNameInputField = Container(
      padding: edgeInsets,
      child: _inputText(hint: 'First Name',obscure: false, controller: firstNameController),
    );

    Widget surnameInputField = Container(
      padding: edgeInsets,
      child: _inputText(hint: 'Surname',obscure: false, controller: surnameController),
    );

    Widget usernameInputField = Container(
      padding: edgeInsets,
      child: _inputText(hint: 'Username',obscure: false, controller: usernameController),
    );

    Widget emailInputField = Container(
      padding: edgeInsets,
      child: _inputText(hint: 'Email',obscure: false, controller: emailController),
    );

    Widget pwdInputField = Container(
      padding: edgeInsets,
      child: _inputText(hint: 'Password',obscure: true, controller: passwordController),
    );

    Widget cpwdInputField = Container(
      padding: edgeInsets,
      child: _inputText(hint: 'Confirm Password',obscure: true, controller: confirmPwdController),
    );



    Widget footSection = Container(
      margin: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text('Already have an account?',style: TextStyle(color:Colors.white, fontSize: 20),),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: commonWidgets.buildButtonMaterial(
                label: 'Sign in',
                color: Colors.white,
                textColor: AppConstants.appPurple,
                minWidth: 50.0,
                callback:
                    () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      // builder methods always take context!
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                }
            ),
          )
          /*Container(
            child: commonWidgets.buildButtonMaterial(label: 'Sign in',color: Colors.white, textColor: AppConstants.appPurple),
          ),*/
        ],
      )
    );


    return Scaffold(
        appBar: AppBar(
        // Here we take the value from the LoginPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Create Account'),
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
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: ListView(
                    children:[
                      Container(
                        padding: EdgeInsets.fromLTRB(32.0, 48.0, 32.0, 24.0),
                        child:Image.asset(
                          "assets/logo_extended.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      firstNameInputField,
                      surnameInputField,
                      usernameInputField,
                      emailInputField,
                      pwdInputField,
                      cpwdInputField,
                      Container(
                        margin: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 0.0),
                        child:Text("Select Location", style: TextStyle(color: Colors.white),),
                      ),
                      Container(
                          margin: edgeInsets,
                          child:
                          DropdownButton(
                            hint: new Text('Select State'),
                            items: stateList,
                            value: _selectedState,

                            onChanged: (value) {
                              print(value);
                              _selectedState = value;
                            },
                            isExpanded: true,
                          )

                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 0.0),
                        child:Text("Select Interest", style: TextStyle(color: Colors.white),),
                      ),
                      Container(
                        margin: edgeInsets,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child:FutureBuilder<List<MyCategory>>(
                                future: fetchPosts(http.Client()),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) print(snapshot.error);

                                  return snapshot.hasData
                                  //new Map<String, dynamic>.from(snapshot.value)
                                      ? ListViewCategories(posts: snapshot.data)
                                  //? ListViewCategories(posts: snapshot.data)
                                      : Center(child: CircularProgressIndicator());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: edgeInsets,
                        //child: _buildButtonMaterial(context: context, label: 'Complete Registration',color: new Color(0xff1565c0)), //new Color(0xff1565c0)
                        child: commonWidgets.buildButtonMaterial(label: 'Complete Registration',color: AppConstants.appBlue),
                      ),
                      footSection,
                    ]
                ),
              ),
              /*Expanded(
                child:FutureBuilder<List<MyCategory>>(
                  future: fetchPosts(http.Client()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);

                    return snapshot.hasData
                    //new Map<String, dynamic>.from(snapshot.value)
                        ? ListViewCategories(posts: snapshot.data)
                        //? ListViewCategories(posts: snapshot.data)
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),*/

            ],
          )
          /*child: ListView(
            children:[
              Container(
                padding: EdgeInsets.fromLTRB(32.0, 48.0, 32.0, 24.0),
                child:Image.asset(
                  "assets/logo_extended.png",
                  fit: BoxFit.contain,
                ),
              ),
              firstNameInputField,
              surnameInputField,
              usernameInputField,
              emailInputField,
              pwdInputField,
              cpwdInputField,
              Container(
                margin: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 0.0),
                child:Text("Select Location", style: TextStyle(color: Colors.white),),
              ),
              Container(
                margin: edgeInsets,
                child:
                    DropdownButton(
                      hint: new Text('Select State'),
                      items: stateList,
                      value: _selectedState,

                      onChanged: (value) {
                        print(value);
                        _selectedState = value;
                      },
                      isExpanded: true,
                    )

              ),
              Container(
                margin: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 0.0),
                child:Text("Select Interest", style: TextStyle(color: Colors.white),),
              ),
              Container(
                margin: edgeInsets,
                child: CheckboxListTile(
                  value: false,
                  onChanged: (value) {
                    //setState(() {
                    //  _termsChecked = value;
                    //});
                  },
                  //subtitle: !_termsChecked
                  //    ? Text(
                  //  'Required',
                  //  style: TextStyle(color: Colors.red, fontSize: 12.0),
                  //)
                  //    : null,
                  title: new Text(
                    'Agriculture and Farms',
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                )
              ),
              Container(
                margin: edgeInsets,
                //child: _buildButtonMaterial(context: context, label: 'Complete Registration',color: new Color(0xff1565c0)), //new Color(0xff1565c0)
                child: commonWidgets.buildButtonMaterial(label: 'Complete Registration',color: AppConstants.appBlue),
              ),
              footSection,
            ]
          ),*/
        )
    );
  }

}