// ignore_for_file: prefer_const_constructors, avoid_print, file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_field, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:firebase/Shared/Constant.dart';
import 'package:firebase/Shared/Loading.dart';
import 'package:firebase/services/Auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function togglevalue;
  SignIn({required this.togglevalue});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auths = AuthServices();
  final _FormKey = GlobalKey<FormState>();
  String Email = '';
  String Password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loader()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.cyan,
              title: Text('Sign into JW'),
            ),
            body: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://i.pinimg.com/originals/2a/53/b5/2a53b522e47e86aa74f2ed456a7ba3aa.jpg'))),
              child: Center(
                child: Container(
                  width: 300,
                  child: Form(
                    key: _FormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (value) =>
                              value!.isEmpty ? 'plz enter Valid email' : null,
                          keyboardType: TextInputType.emailAddress,
                          decoration: textinputDecoration.copyWith(
                              hintText: 'Email', icon: Icon(Icons.email)),
                          onChanged: (value) {
                            setState(() {
                              Email = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (value) => value!.length < 6
                              ? 'plz enter Valid Password'
                              : null,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: textinputDecoration.copyWith(
                              hintText: 'Password', icon: Icon(Icons.lock)),
                          obscureText: true,
                          onChanged: (value) {
                            Password = value;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () async {
                                if (_FormKey.currentState!.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auths.SignInUsingEmailAndPassword(
                                          Email, Password);

                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                      error = 'Invalid Credential';
                                    });
                                  }
                                }
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                widget.togglevalue();
                              },
                              child: Text(
                                'Register?',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  // Future SendData() async {
  //   dynamic result = await _auths.SignInAnon();
  //   if (result == null) {
  //     print('Error 404');
  //   } else {
  //     print('Signed In Successfully');
  //     print(result.uid);
  //   }
  // }
}
