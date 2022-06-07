import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/models/complaints.dart';
import 'package:login/providers/complaintp.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    List<Complain> complaints = Provider.of<ComplaintP>(context).complaints;
    //get all not resolved complaints
    complaints =
        complaints.where((complaint) => complaint.isSolved == false).toList();
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
            for (var i = 0; i < complaints.length; i++)
              ComplaintCard(
                complaintId: complaints[i].id,
                complaintCategory: complaints[i].catagory,
                subCategory: complaints[i].subCatagory,
                date: complaints[i].date,
                description: complaints[i].description,
                imageUrl: complaints[i].imageUrl.toString(),
                onPressed: () {},
              ),
          ],
        )),
      ),
    );
  }
}
