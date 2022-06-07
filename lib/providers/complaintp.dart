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
  }

  //get all categories from database
  Future<List<Complain>> getComplaints() async {
    final databaseReference = _transactions.getCategories();
    return await databaseReference.once();
  }

  //get complaints of logged in user
  Future getUserComplaints() async {
    final databaseReference = _transactions.getUserComplaints();
    _complaints.add(databaseReference);
    notifyListeners();
  }

  //delete complaint
  Future deleteComplaint(String complaintId) async {
    final databaseReference = _transactions.deleteComplaint(complaintId);
    //pop from list
    _complaints.removeWhere((complaint) => complaint.id == complaintId);
  }
}
