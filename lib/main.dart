// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:firebase/Authenticate/Register.dart';
import 'package:firebase/Authenticate/SignIN.dart';
import 'package:firebase/Models/User.dart';
import 'package:firebase/MainPage.dart';
import 'package:firebase/home/Wrapper.dart';
import 'package:firebase/services/Auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      value: AuthServices().users,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FireBase',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: Wrapper(),
        routes: {
          'SecondPage': (context) => SecondPage(),
        },
      ),
    );
  }
}
