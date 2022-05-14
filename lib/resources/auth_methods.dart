import 'dart:typed_data';

import 'package:affection/resources/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String name,
    required String email,
    required String password,
    required String username,
    required Uint8List file,
  }) async {
    String res = "Some Error Occured";
    try {
      if (name.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          file != null) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // print(credential.user!.uid);

        String photoURL = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        await _firestore.collection('users').doc(credential.user!.uid).set({
          'uid': credential.user!.uid,
          'name': name,
          'username': username,
          'email': email,
          'followers': [],
          'following': [],
          'photoURL': photoURL,
        });
        res = "Success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}


