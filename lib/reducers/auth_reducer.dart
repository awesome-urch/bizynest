import 'package:bizynest/actions/auth_actions.dart';
import 'package:redux/redux.dart';

// This is a built in method for creating type safe reducers.
// The alternative is building something the way we did with
// the counter reducer -- a simple method.
//
// This is the preferred method and it allows us to create
// modular functions that are safer.
//
final authReducer = combineReducers<String>([
  // create a reducer binding for each possible reducer--
  // generally thered be one for each possible action a user
  // will take.
  // We'll pass in what a method, which takes a piece of
  // application state and an action.
  // In this case, auth methods take a user as the piece
  // of state
  //
  new TypedReducer<String, LogInSuccessful>(_logIn),
  new TypedReducer<String, LogOut>(_logOut),
]);

// Create the actual reducer methods:
//
// this is dispatched from the LogIn middleware,
// That middleware passes in the user and the action.
// All the reducer needs to do is replace the slice of state
// That handles user.
//
// *NB -- We haven't actually added a user to the state yet.
String _logIn(String user, action) {
  return action.user;
}

// This will just replace the user slice of state with null.
Null _logOut(String user, action) {
  return null;
}