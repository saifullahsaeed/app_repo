import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/users.dart';
import '../transactions/transactions.dart';

class UserP with ChangeNotifier {
  Transactions _transactions = Transactions();

  late String _userId;
  late Users _user;
  String get userId => _userId;

  void setUserId(String userId) {
    _userId = userId;
    notifyListeners();
  }

  // register user
  Future<String?> signUpUser(Users user) async {
    try {
      final newUser = await _transactions.signUpUser(user);
      if (newUser != null) {
        setUserId(newUser);
        return newUser;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //login
  Future<String?> loginUser(String email, String password) async {
    String? userId = await _transactions.signInUser(email, password);
    if (userId != null) {
      setUserId(userId);
    }
    return userId;
  }

  //check if user is signed in
  Future<bool?> checkSignedIn(BuildContext context) {
    Future<String?> userId = Transactions.checkSignedIn();
    return userId.then((userId) {
      if (userId != null) {
        return true;
      } else {
        return false;
      }
    });
  }

  //get user info
  getUserInfo(String userId) async {
    try {
      var data = _transactions.getUserInfo(userId);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //sign out
  Future<void> signOutUser() async {
    await _transactions.signOutUser();
    setUserId('');
  }

  //check if user is admin
  Future<bool?> checkAdmin(BuildContext context) async {
    bool? userId = await checkSignedIn(context);
    if (userId != null) {
      return await _transactions.checkAdmin(userId);
    } else {
      return null;
    }
  }
}
