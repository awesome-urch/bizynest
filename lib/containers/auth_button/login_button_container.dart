import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:bizynest/actions/auth_actions.dart';
import 'package:bizynest/models/app_state.dart';

class AuthButtonContainer extends StatelessWidget {
  AuthButtonContainer({Key key, this.username, this.password}) : super(key: key);

  final String username;
  final String password;

  void _testFn(String s){
    print(s);
  }

  @override
  Widget build(BuildContext context) {
    // Connect to the store:
    return new StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        // We haven't made this yet.
        return new Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(0.0),
          color: Color(0xff1565c0),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            //onPressed: () => vm.onPressedCallback(username,password),
            onPressed: ()=>_testFn(username),
            child: Text(vm.buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final String buttonText;
  final Function onPressedCallback;

  _ViewModel({this.onPressedCallback, this.buttonText});

  static _ViewModel fromStore(Store<AppState> store) {
    // This is a bit of a more complex _viewModel
    // constructor. As the state updates, it will
    // recreate this _viewModel, and then pass
    // buttonText and the callback down to the button
    // with the appropriate qualities:
    //
    return new _ViewModel(
        buttonText:
        store.state.currentUser != null ? 'Logout' : 'Login',
        onPressedCallback: (String username, String password) {
          print(username);
          if (store.state.currentUser != null) {
            store.dispatch(new LogOut());
          } else {
            store.dispatch(new LogIn(username: username, password: password));
          }
        });
  }
}

