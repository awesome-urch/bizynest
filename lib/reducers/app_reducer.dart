import 'package:bizynest/models/app_state.dart';
import 'package:bizynest/reducers/counter_reducer.dart';
import 'package:bizynest/reducers/auth_reducer.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    isLoading: false,
    count: counterReducer(state.count, action),
    currentUser: authReducer(state.currentUser, action),
  );
}