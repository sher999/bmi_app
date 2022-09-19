// ignore_for_file: prefer_const_constructors

import 'package:bmi_app/methods/calculation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  double height;
  double weight;
  String age;
  String name;
  String dob;
  String gender;

  // ignore: use_key_in_widget_constructors
  ResultPage({
    required this.height,
    required this.weight,
    required this.age,
    required this.name,
    required this.dob,
    required this.gender,
  });

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double bmires = 0;
  String bmiAge = 'Age';
  void initState() {
    Logic l = Logic();
    bmires = l.calculateBMI(widget.height.toDouble(), widget.weight.toDouble());
    updateUser();
    super.initState();
  }

  void updateUser() {
    final docUser = FirebaseFirestore.instance.collection('users').doc('uid');

    docUser.update({'bmi': bmires.toStringAsFixed(2)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${bmires.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
                'Bmi between 18 to 22 is good otherwise it is too low or too high')
          ],
        ),
      ),
    );
  }
}
