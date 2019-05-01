import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:bizynest/actions/counter_actions.dart';
import 'package:bizynest/models/app_state.dart';

class IncreaseCountButton extends StatelessWidget{
  IncreaseCountButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, VoidCallback>(
      converter: (store) {
        //print(40);
        // Return a `VoidCallback`, which is a fancy name for a function
        // with no parameters. It only dispatches an Increment action.
        return () => {
        store.dispatch(new IncrementCountAction())
        };
      },
      builder: (context, callback) {
        return new FloatingActionButton(
          // Attach the `callback` to the `onPressed` attribute
          onPressed: () => callback(),
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        );
      },
    );
  }

}