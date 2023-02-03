// ignore_for_file: non_constant_identifier_names, empty_catches, unused_local_variable, avoid_print, unnecessary_null_comparison, unused_element, recursive_getters

import 'package:firebase/Models/User.dart';
import 'package:firebase/services/DataBase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Users? _FromFirebaseUser(User? Useruid) {
    return Useruid != null ? Users(uid: Useruid.uid) : null;
  }

  Stream<Users?> get users {
    return _auth.authStateChanges().map(_FromFirebaseUser);
  }

  Future SignInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;

      return _FromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future LoginUsingEmailAndPassword(String Email, String Password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: Email, password: Password);
      User? user = result.user;
      await DatabaseService(uid: user!.uid)
          .UpdateUserData('0', 'New Member', 0);
      return _FromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future SignInUsingEmailAndPassword(String Email, String Password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: Email, password: Password);
      User? user = result.user;
      return _FromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
