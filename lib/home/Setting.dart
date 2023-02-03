// ignore_for_file: prefer_const_literals_to_create_immutables, unused_field, prefer_const_constructors, prefer_final_fields, avoid_print, unrelated_type_equality_checks, avoid_unnecessary_containers, unused_local_variable, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:firebase/Models/User.dart';
import 'package:firebase/Shared/Loading.dart';
import 'package:firebase/services/DataBase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugar = ['0', '1', '2', '3', '4'];

  String _currentName = '';
  String _currentSugar = '';
  int _currentStrength = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).Userdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userdata = snapshot.data;
            return Form(
              key: _formkey,
              child: Center(
                child: Container(
                  width: 300,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Update your settings',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'plz enter Valid email' : null,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: 'Enter your Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onChanged: (value) {
                          setState(() {
                            _currentName = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        value: snapshot.data!.Sugars,
                        items: sugar.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text('$e Sugars'),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _currentSugar = value!;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      Slider(
                        label: _currentStrength.toString(),
                        activeColor: Colors.brown[_currentStrength],
                        inactiveColor: Colors.brown[_currentStrength],
                        min: 100.0,
                        max: 900.0,
                        divisions: 8,
                        value: 100,
                        onChanged: (value) {
                          setState(() {
                            _currentStrength = value.round();
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            await DatabaseService(uid: user.uid).UpdateUserData(
                              _currentSugar,
                              _currentName,
                              _currentStrength,
                            );
                          }
                        },
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Loader();
          }
        });
  }
}
