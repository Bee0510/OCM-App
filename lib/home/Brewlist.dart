// ignore_for_file: non_constant_identifier_names, avoid_print, avoid_types_as_parameter_names, prefer_const_constructors

import 'package:firebase/Brew_tile.dart';
import 'package:firebase/Models/Brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chailist extends StatefulWidget {
  const Chailist({super.key});

  @override
  State<Chailist> createState() => _ChailistState();
}

class _ChailistState extends State<Chailist> {
  @override
  Widget build(BuildContext context) {
    final chai = Provider.of<List<Brew>>(context);

    return ListView.builder(
      itemCount: chai.length,
      itemBuilder: (context, Index) {
        return BrewTile(chai[Index]);
      },
    );
  }
}
