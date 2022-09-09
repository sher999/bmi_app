import 'dart:typed_data';

import 'package:bmi_app/methods/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:instagram/resource/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // signup user
  Future<String> signUpUser({
    // required String email,
    required String gender,
    // String? id,
    required String height,
    required String weight,
    required String name,
    required String dob,
    required String age,
    required String bmi,
    // required String bio,
    // required Uint8List file,
  }) async {
    String res = "Success";
    try {
      if (height.isNotEmpty ||
          name.isNotEmpty ||
          age.isNotEmpty ||
          gender.isNotEmpty ||
          dob.isNotEmpty ||
          bmi.isNotEmpty ||
          weight.isNotEmpty) {
        // add user to databse
        final docUser = await _firestore.collection('users').doc().set(
          {
            'name': name,
            // 'uid': docUser.id  ,
            'age': age,
            'gender': gender,
            'dob': dob,
            'height': height,
            'weight': weight,
            'bmi': bmi,
          },
        );
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // loging in User

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occured';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success ';
      } else {
        res = 'please enter all the fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Future getUsersList() async {
  //   List itemsList = [];
  //   try {
  //     await profilelist.getDocuments().then((querySnapshot) {
  //       querySnapshot.documents.forEach((element) {
  //         itemsList.add(element.data);
  //       });
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}
