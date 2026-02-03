import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taski/constants/app_colors.dart';
import 'package:taski/models/user_model.dart';
import 'package:taski/screens/dashboard_screen.dart';

class AppAuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isLoggedIn => _auth.currentUser != null;

  UserModel? userData;

  Future signUpUser({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        userData = UserModel(name: name, email: email);

        var userDataAsJson = userData!.toJson();

        await FirebaseFirestore.instance
            .collection('allUsers')
            .doc(email)
            .set(userDataAsJson);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );

        Fluttertoast.showToast(
          msg: 'Account created successfully',
          backgroundColor: AppColors.success,
        );

        notifyListeners();
      } else {
        Fluttertoast.showToast(
          msg: 'Problem occurred while creating user',
          backgroundColor: AppColors.error,
        );
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message ?? 'Authentication error occurred',
        backgroundColor: AppColors.error,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: AppColors.error,
      );
    }
  }

  Future signInUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        var userDataAsJson = await FirebaseFirestore.instance
            .collection('allUsers')
            .doc(email)
            .get();

        if (userDataAsJson.exists) {
          userData = UserModel.fromJson(
            userDataAsJson.data() as Map<String, dynamic>,
          );
          notifyListeners();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: 'Problem occurred while signing in',
          backgroundColor: AppColors.error,
        );
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message ?? 'Authentication error occurred',
        backgroundColor: AppColors.error,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: AppColors.error,
      );
    }
  }

  signOut() async {
    await _auth.signOut();
  }
}
