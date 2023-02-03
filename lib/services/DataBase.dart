// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Models/Brew.dart';
import 'package:firebase/Models/User.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference ChaiCollection =
      FirebaseFirestore.instance.collection('CHAI');
  Future UpdateUserData(String sugars, String name, int strength) async {
    return await ChaiCollection.doc(uid).set({
      'Sugar': sugars,
      'name': name,
      'strength': strength,
    });
  }

  List<Brew> brewlistfromanapshots(QuerySnapshot Snapshot) {
    return Snapshot.docs.map(
      (e) {
        return Brew(
          name: e['name'] ?? '',
          sugars: e['Sugar'] ?? '0',
          strength: e['strength'] ?? '0',
        );
      },
    ).toList();
  }

  UserData UserdataFromSnapshots(DocumentSnapshot snapshot) {
    return UserData(
      Name: snapshot['name'],
      Strength: snapshot['strength'],
      Sugars: snapshot['Sugar'],
      uid: uid,
    );
  }

  Stream<List<Brew>> get Chai {
    return ChaiCollection.snapshots().map(brewlistfromanapshots);
  }

  Stream<UserData> get Userdata {
    return ChaiCollection.doc(uid).snapshots().map(UserdataFromSnapshots);
  }
}
