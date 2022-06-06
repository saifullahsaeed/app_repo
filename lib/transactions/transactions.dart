import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

import '../cms_user_panel/dashboard_screens/cms_screen_user_dashboard.dart';
//import firebase database

class Transactions {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return null;
    }
  }

  //check if user is signed in
  static Future<String?> checkSignedIn() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return Future.value(user.uid);
    } else {
      return Future.value(null);
    }
  }

  //sign out
  Future<void> signOutUser() async {
    await _auth.signOut();
  }

  checkAdmin(bool userId) {}
}
