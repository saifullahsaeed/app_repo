import 'package:flutter/cupertino.dart';
import 'package:login/transactions/transactions.dart';

import '../models/complaints.dart';

class ComplaintP with ChangeNotifier {
  final List<Complain> _complaints = [];
  Transactions _transactions = Transactions();
  List<Complain> get complaints {
    return [..._complaints];
  }

  void addComplaint(Complain complaint) {
    _complaints.add(complaint);
    _transactions.addComplaint(complaint);
    notifyListeners();
  }

  //get all categories from database
  Future<List<Complain>> getComplaints() async {
    final databaseReference = _transactions.getCategories();
    return await databaseReference.once();
  }
}
