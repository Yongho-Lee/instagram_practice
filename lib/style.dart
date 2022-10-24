import 'package:flutter/material.dart';

var theme = ThemeData(
  iconTheme: IconThemeData( color: Colors.blue),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      // titleTextStyle: TextStyle(blahblah)
      actionsIconTheme: IconThemeData(color:Colors.black)
  ),
  textTheme: TextTheme(
      bodyText2: TextStyle(color:Colors.grey)
  ),
);