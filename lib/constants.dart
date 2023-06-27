import 'package:flutter/material.dart';
import 'dart:math';

class Constants {
  static const mainColor = Color(0xFF0A0E21);
  static const contColor = Color(0xFF1D1F33);
  static const inactiveContColor = Color(0xFF131226);
  static const appRedColor = Color(0xFFEB1555);
  static const double bottomContHeight = 80;
  static const double iconSizes = 80;
  static const Color iconActiveColor = Color(0xFFFFFFFF);
  static const Color iconInactiveColor = Color(0xFF8D8E98);
  static const iconTextStyle =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white);
  static const basicMargin = EdgeInsets.all(10);
  static const numbersTextStyle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 60,
    color: Colors.white,
  );
}

enum Gender {
  male,
  female,
}

typedef SliderFun = void Function(double pos);

class Bmi {
  Bmi({
    required this.height,
    required this.weight,
  });
  final double height;
  final double weight;
  double bmi = 0;

  void init() {
    bmi = weight / pow((height / 100), 2);
  }

  String getBmi() {
    return bmi.toStringAsFixed(1);
  }

  String getTitle() {
    if (bmi >= 25) {
      return "OverWeight";
    } else if (bmi > 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getAdvice() {
    if (bmi >= 25) {
      return "Excercise you Fat Cunt!";
    } else if (bmi > 18.5) {
      return "You Should Go kill yourself for trying too hard!";
    } else {
      return "You shouldn't even be alive ,Congrats!";
    }
  }
}
