import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
  GetUserName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return SizedBox(
            height: 50,
            width: 50,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '${data['name']}',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${data['age']}',
                        style:
                            TextStyle(color: Colors.green[800], fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${data['weight']}',
                        style: TextStyle(color: Colors.blue[800], fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '${data['dob']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${data['gender']}',
                        style:
                            TextStyle(color: Colors.green[800], fontSize: 16),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${data['height']}',
                        style: TextStyle(color: Colors.blue[800], fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return const Text(' loading .. ');
      }),
    ); // FutureBuilde
  }
}
