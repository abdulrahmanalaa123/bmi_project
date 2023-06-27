import 'package:flutter/material.dart';
import 'constants.dart';
import 'mainPage.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Constants.mainColor,
          scaffoldBackgroundColor: Constants.mainColor),
      home: const HomePage(),
    ),
  );
}
