// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../methods/get_user_name.dart';

class UserD extends StatefulWidget {
  const UserD({Key? key}) : super(key: key);

  @override
  State<UserD> createState() => _UserDState();
}

class _UserDState extends State<UserD> {
  final user = FirebaseAuth.instance.currentUser!;
// document IDs
  List<String> docIDs = [];
// get docIDS
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  // @override
  // void initState() {
  //   getDocId();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder(
          future: getDocId(),
          builder: (context, snapshot) {
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Userdetails(documentId: docIDs[index],)),
                // );
              },
              child: ListView.builder(
                itemCount: docIDs.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    // decoration: Decoration(),
                    // shape: RoundedRectangleBorder(
                    //   side: BorderSide(
                    //     color: Theme.of(context).colorScheme.outline,
                    //   ),
                    //   borderRadius: const BorderRadius.all(Radius.circular(12)),
                    // ),
                    // shape: Materia,
                    child: GetUserName(
                      documentId: docIDs[index],
                    ),
                    // ListTile(
                    //   // title: Text(userProfilesList[index]['username']),
                    //   // subtitle: Text('Male'),
                    //   leading:
                    //       //  Text('Sher'),
                    //       GetUserName(
                    //     documentId: docIDs[index],
                    //   ),
                    //   //  CircleAvatar(
                    //   //   child: Image(
                    //   //     image: AssetImage('assets/Profile_Image.png'),
                    //   //   ), // Image
                    //   // ), // CircleAvatar
                    //   // trailing: Text('Score: 100'),
                    // ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
