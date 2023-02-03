// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, file_names

import 'package:firebase/Models/Brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile(this.brew);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://tse3.mm.bing.net/th?id=OIP.nvDrV1ZB5eYWuBbaV1lXBQHaHb&pid=Api&P=0'),
            radius: 25,
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(brew.name),
          subtitle: Text('You want ${brew.sugars} Sugar'),
        ),
      ),
    );
  }
}
