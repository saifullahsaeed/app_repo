import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components_app/cms_user_app_drawer.dart';
import '../../components_app/cms_complaint_card.dart';

class UserPendingComplainsScreens extends StatefulWidget {
  const UserPendingComplainsScreens({Key? key}) : super(key: key);

  @override
  State<UserPendingComplainsScreens> createState() =>
      _UserPendingComplainsScreensState();
}

class _UserPendingComplainsScreensState
    extends State<UserPendingComplainsScreens> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final _firestore = FirebaseFirestore.instance;
  late final complaintsRef;

  getComplaints() {
    complaintsRef = _firestore
        .collection('Users')
        .doc(uid)
        .collection('UserComplains')
        .get()
        .then((QuerySnapshot snapshot) {
      for (var documentSnapshot in snapshot.docs) {
        print(documentSnapshot.data());
      }
    });
    return complaintsRef;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Pending Complaints'),
        centerTitle: true,
      ),
      drawer: const MyAppDrawer(),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            ComplaintCard(
              onPressed: getComplaints,
            )
          ],
        )),
      ),
    );
  }
}
