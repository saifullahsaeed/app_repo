import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
      storageReference.getDownloadURL().then((fileURL) {
        _imageUrl = fileURL;
      });
    } else {
      _imageUrl = null;
    }
    final databaseReference =
        FirebaseDatabase.instance.reference().child('Complaints');
    databaseReference.push().set({
      'catagory': complaint.catagory.toJson(),
      'subCatagory': complaint.subCatagory.toJson(),
      'date': complaint.date,
      'description': complaint.description,
      'imageUrl': _imageUrl,
      'isSolved': complaint.isSolved,
      'status': complaint.status,
    });
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
    databaseReference.set('resolved');
  }
}
