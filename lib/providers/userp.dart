import 'package:flutter/material.dart';
import '../transactions/transactions.dart';

class UserP with ChangeNotifier {
  Transactions _transactions = Transactions();

  late String _userId;

  String get userId => _userId;

  void setUserId(String userId) {
    _userId = userId;
    notifyListeners();
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
