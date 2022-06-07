import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:login/models/users.dart';

import '../cms_user_panel/dashboard_screens/cms_screen_user_dashboard.dart';
import '../models/complaints.dart';
//import firebase database

class Transactions {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //register user and save to database
  Future<String?> signUpUser(Users user) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      //inset other data to database

      if (newUser.user != null) {
        //save user to database
        final databaseReference =
            FirebaseDatabase.instance.reference().child('Users');
        databaseReference.push().set({
          'userId': newUser.user?.uid,
          'email': user.email,
          'password': user.password,
          'name': user.fname + ' ' + user.lname,
          'phone': user.phone,
          'role': user.role,
        });
        return newUser.user?.uid;
      }
      if (newUser.user != null) {
        return newUser.user?.uid;
      }
    } on FirebaseAuthException catch (e) {
      //show toast
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return null;
  }

  //get user info
  Future<Users?> getUserInfo(String userId) async {
    try {
      final databaseReference =
          FirebaseDatabase.instance.reference().child('Users');
      databaseReference.once().then((snapshot) {
        var user = snapshot.snapshot.value;
        Users? values;
        Users converted = values?.toJson(snapshot.snapshot.value) as Users;
        return converted;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

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

  //add category to database using catagory model
  addCategory(Catagory category) async {
    final databaseReference =
        FirebaseDatabase.instance.reference().child('Categories');
    databaseReference.set({
      'categoryName': category.name,
      'categoryDescription': category.description,
    });
  }

  //add subcategory to database using subcategory model
  addSubCategory(SubCatagory subCategory) async {
    final databaseReference =
        FirebaseDatabase.instance.reference().child('SubCategories');
    databaseReference.set({
      'subCategoryName': subCategory.name,
      'subCategoryDescription': subCategory.description,
      'categoryId': subCategory.categoryId,
    });
  }

  //add complaint to database using complaint model
  addComplaint(Complain complaint) async {
    String? _imageUrl;
    //upload image to firebase storage
    if (complaint.imageUrl != null) {
      final storageReference = FirebaseStorage.instance
          .ref()
          .child('complaints/${complaint.imageUrl.path.split('/').last}');
      final uploadTask = storageReference.putFile(complaint.imageUrl);
      print('File Uploaded');

      final databaseReference =
          FirebaseDatabase.instance.reference().child('Complaints');
      final downloadUrl = await uploadTask.then((p0) => {
            p0.ref.getDownloadURL().then((p1) => {
                  _imageUrl = p1,
                })
          });
    } else {
      _imageUrl = null;
    }
  }

  //get all categories from database
  getCategories() async {
    final databaseReference =
        FirebaseDatabase.instance.reference().child('Categories');
    return await databaseReference.once();
  }

  //get all subcategories from database
  getSubCategories() async {
    final databaseReference =
        FirebaseDatabase.instance.reference().child('SubCategories');
    return await databaseReference.once();
  }

  //get all complaints from database
  getComplaints() async {
    final databaseReference =
        FirebaseDatabase.instance.reference().child('Complaints');
    return await databaseReference.once();
  }

  //get single complaint from database
  getSingleComplaint(String complaintId) async {
    final databaseReference = FirebaseDatabase.instance
        .reference()
        .child('Complaints')
        .child(complaintId);
    return await databaseReference.once();
  }

  //set complaint status to resolved
  setComplaintStatus(String complaintId) async {
    final databaseReference = FirebaseDatabase.instance
        .reference()
        .child('Complaints')
        .child(complaintId)
        .child('status');

    databaseReference.set(1);
    final databaseReference2 = FirebaseDatabase.instance
        .reference()
        .child('Complaints')
        .child(complaintId)
        .child('isSolved');
    databaseReference2.set(true);
  }

  //get all complaints of logged in user
  getUserComplaints() async {
    final databaseReference = FirebaseDatabase.instance
        .reference()
        .child('Complaints')
        .orderByChild('userId')
        .equalTo(_auth.currentUser?.uid);
    return await databaseReference.once();
  }

  //delete complaint from database
  deleteComplaint(String complaintId) async {
    final databaseReference = FirebaseDatabase.instance
        .reference()
        .child('Complaints')
        .child(complaintId);
    databaseReference.remove();
  }
}
