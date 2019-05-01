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
}