// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:firebase/Authenticate/Register.dart';
import 'package:flutter/material.dart';

import 'SignIN.dart';

class Authenticate extends StatefulWidget {
  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool IsSignedIN = true;

  void toggleview() {
    setState(() {
      IsSignedIN = !IsSignedIN;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (IsSignedIN) {
      return SignIn(
        togglevalue: toggleview,
      );
    } else {
      return Register(
        togglevalue: toggleview,
      );
    }
  }
}
