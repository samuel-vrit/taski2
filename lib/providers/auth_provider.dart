import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppAuthProvider extends ChangeNotifier {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUpUser({required String email, required String password}) async {
    try {
      var userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        print('Account created successfully');
      } else {
        print('Problem occured while creating user');
      }
    } catch (e) {
      print(e);
    }
  }
}
