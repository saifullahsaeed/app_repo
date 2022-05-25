import 'package:flutter/material.dart';
import 'package:login/admin_panel/admin_complaints/complaints_histroy.dart';
import 'package:login/admin_panel/admin_complaints/completed_complaints.dart';
import 'package:login/admin_panel/admin_complaints/pending_complaints.dart';

import '../admin_complaints/in_progress_complaints.dart';

class ManageComplaints extends StatefulWidget {
  const ManageComplaints({Key? key}) : super(key: key);

  @override
  State<ManageComplaints> createState() => _ManageComplaintsState();
}

class _ManageComplaintsState extends State<ManageComplaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Complaints'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PendingComplainsScreens()));
                  },
                  child: const Text('Pending Complaints'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const InProgressComplaintsScreen()));
                  },
                  child: const Text('In-progress Complaints'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CompletedComplaintsScreen()));
                  },
                  child: const Text('Complete Complaints'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ComplaintsHistoryScreen()));
                  },
                  child: const Text('Complaints history'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
