// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unused_local_variable, prefer_const_declarations, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:firebase/Shared/Loading.dart';
import 'package:firebase/services/Auth.dart';
import 'package:flutter/material.dart';

import '../Shared/Constant.dart';

class Register extends StatefulWidget {
  final Function togglevalue;
  Register({required this.togglevalue});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String Email = '';
  String Password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final Modelroute = 'SignInPage';
    return loading
        ? Loader()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown[300],
              title: Text('Register to JW'),
              actions: <Widget>[
                IconButton(onPressed: () {}, icon: Icon(Icons.person)),
                TextButton(
                    onPressed: () {
                      widget.togglevalue();
                    },
                    child: Text('Sign in'))
              ],
            ),
            body: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Enter Your Email' : null,
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
                          ? 'Enter Password of 6+ char'
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
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => loading = true);
                            dynamic result =
                                await _auth.LoginUsingEmailAndPassword(
                                    Email, Password);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                error = 'An error occured';
                              });
                            }
                          }
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        )),
                    SizedBox(height: 20),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                )));
  }
}
