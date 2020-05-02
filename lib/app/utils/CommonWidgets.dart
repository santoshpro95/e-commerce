import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mecommerce/app/config/ColorsSet.dart';

class CommonWidgets{


  static showErrorMessage(
      GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      duration: Duration(seconds: 5),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: new Text(
                message,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Container(
            height: 40,
            child: CupertinoButton(
              padding: EdgeInsets.all(0),
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () => scaffoldKey.currentState.hideCurrentSnackBar(),
            ),
          )
        ],
      ),
      backgroundColor: Colors.red,
    ));
  }

  static showSuccessMessage(
      GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      duration: Duration(seconds: 10),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: new Text(
                message,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          Container(
            height: 40,
            child: CupertinoButton(
              padding: EdgeInsets.all(0),
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () => scaffoldKey.currentState.hideCurrentSnackBar(),
            ),
          )
        ],
      ),
      backgroundColor: Colors.green,
    ));
  }

}