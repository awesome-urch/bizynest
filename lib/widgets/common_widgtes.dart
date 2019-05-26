import 'package:bizynest/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CommonWidgets{
  final BuildContext context;

  CommonWidgets({@required this.context});


  Widget buildButtonMaterial({String label, Color color, Color textColor, double minWidth, VoidCallback callback }){
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(0.0),
      color: color==null?AppConstants.appBlue:color,
      child: MaterialButton(
        minWidth: (minWidth==null)?MediaQuery.of(context).size.width:minWidth,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: callback,
        child: Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: (textColor==null)?Colors.white:textColor, fontWeight: FontWeight.bold, fontSize: 20.0)),
      ),
    );
  }


  /*

  Builder(
      // Create an inner BuildContext so that the onPressed methods
      // can refer to the Scaffold with Scaffold.of().
      builder: (BuildContext context) {

 */

  Widget buildButtonMaterial2({String label, Color color, Color textColor, double minWidth, VoidCallback callback }){

    return Builder(
      // Create an inner BuildContext so that the onPressed methods
      // can refer to the Scaffold with Scaffold.of().
        builder: (BuildContext context) {
          return Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(0.0),
            color: color==null?AppConstants.appBlue:color,
            child: MaterialButton(
              minWidth: (minWidth==null)?MediaQuery.of(context).size.width:minWidth,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              /*onPressed: (){
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Have a snack!'),
                  ),
                );
              },*/
              onPressed: ()=>callback,
              child: Text(label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: (textColor==null)?Colors.white:textColor, fontWeight: FontWeight.bold, fontSize: 20.0)),
            ),
          );
        }
    );
  }


  Widget buildInputText({String hint, TextEditingController controller, bool obscure, TextInputType inputType}){
    return TextField(
        style: TextStyle(color: Colors.white),
        obscureText: (obscure==null)?false:true,
        controller: controller,
        keyboardType: inputType,
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

  Widget buildSnackBar({VoidCallback callback, String actionLabel, String text, bool action}){
    return SnackBar(
      content: Text('$text'),
      action: (!action)?null:SnackBarAction(
      label: actionLabel,
      onPressed: callback,
      ),
    );
}

}