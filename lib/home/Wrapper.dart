// ignore_for_file: file_names, prefer_const_constructors, avoid_print, use_key_in_widget_constructors
import 'package:firebase/Models/User.dart';
import 'package:firebase/MainPage.dart';
import 'package:provider/provider.dart';

import '../Authenticate/Authenticates.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return SecondPage();
    }
  }
}
