// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:firebase/Models/Brew.dart';
import 'package:firebase/home/Setting.dart';
import 'package:firebase/services/Auth.dart';
import 'package:firebase/services/DataBase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './home/Brewlist.dart';

class SecondPage extends StatefulWidget {
  final AuthServices _auth = AuthServices();
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  void BottomDrawer() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: SettingForm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService(uid: '').Chai,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('JW CHAI SUTA'),
          actions: <Widget>[
            Icon(Icons.person),
            TextButton(
              onPressed: () async {
                await widget._auth.SignOut();
              },
              child: Text(
                'Log Out',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton.icon(
              onPressed: () => BottomDrawer(),
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              label: Text(
                'Settings',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://wallpaperaccess.com/full/3560121.jpg'))),
            child: Chailist(),
          ),
        ),
      ),
    );
  }
}
