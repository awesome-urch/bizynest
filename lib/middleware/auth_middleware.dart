import 'package:redux/redux.dart';
import 'package:bizynest/actions/auth_actions.dart';
import 'package:bizynest/models/app_state.dart';

// Recall that middleware is simply functions.
//
// These functions more or less intercept actions -- pausing
// the Redux cycle while your app does some work.
//
// If you have multiple middleware functions that are related
// to a single piece of state, you can use a method like this
// which will return multiple functions that you can add
// to your store.
//

List<Middleware<AppState>> createAuthMiddleware() {
  final logIn = _createLogInMiddleware();
  final logOut = _createLogOutMiddleware();

  // Built in redux method that tells your store that these
  // are middleware methods.
  //
  // As the app grows, we can add more Auth related middleware
  // here.
  return ([
    new TypedMiddleware<AppState, LogIn>(logIn),
    new TypedMiddleware<AppState, LogOut>(logOut)
  ]);
}

// Now, we need to write those two methods, both of which
// return a Middleware typed function.
//
Middleware<AppState> _createLogInMiddleware() {
  // These functions will always take
  // your store,
  // the action thats been dispatched
  // and the a special function called next.
  return (Store store, action, NextDispatcher next) async {
    // YOUR LOGIC HERE
    if(action is LogIn){
      print("Logged In!");
      store.dispatch(new LogInSuccessful(user: '20'));
    }

    // After you do whatever logic you need to do,
    // call this Redux built-in method,
    // It continues the redux cycle.
    next(action);
  };
}

Middleware<AppState> _createLogOutMiddleware() {
  return (Store store, action, NextDispatcher next) async {
    // YOUR LOGIC HERE
    print('logging out...');
    store.dispatch(new LogOutSuccessful());
    next(action);
  };
}