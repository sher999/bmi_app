import 'package:bmi_app/auth_methods/auth.dart';
// ignore_for_file: prefer_const_constructors
import 'package:bmi_app/screens/user_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'bmi_cal.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  // Widget _title() {
  //   return const Text('Firebase Auth');
  // }

  Widget _userId() {
    return Text(user?.email ?? 'User Email');
  }

  Widget _sighOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  Widget _calculateButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Calculate BMI'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: _title(),
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        actions: [_sighOutButton()],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 650,
              // width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // _userId(),
                  _sighOutButton(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InputPage()),
                      );
                    },
                    child: const Text('Calculate BMI'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
                title: const Text('Add New User'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SignUpSreen()),
                  // );
                }),
            ListTile(
              title: const Text('See All User'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserD()),
                );
              },
            ),
            ListTile(
              title: const Text('Sign Out'),
              onTap: signOut,
            ),
          ],
        ),
      ),
    );
  }
}
