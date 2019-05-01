// gives us access to `@required`
import 'package:flutter/foundation.dart';

class LogIn{
  final String username;
  final String password;

  LogIn({this.username, this.password});


}

class LogInSuccessful{
  final String user;
  LogInSuccessful({ @required this.user });

  @override
  String toString() {
    return 'LogIn{user: $user}';
  }

}

class LogInFail{

}

class LogOut{}

class LogOutSuccessful{
  LogOutSuccessful();
  @override
  String toString() {
    return 'LogOut{user: null}';
  }
}

