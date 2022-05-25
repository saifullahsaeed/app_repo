import 'package:flutter/material.dart';
import 'package:login/admin_panel/admin_complaints/completed_complaints.dart';
import 'package:login/admin_panel/admin_complaints/in_progress_complaints.dart';
import 'package:login/components_app/app_drawer.dart';

import '../admin_panel/admin_complaints/pending_complaints.dart';
import '../components_app/dashboard_card.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Admin DashBoard'),
      ),
      drawer: const MyAppDrawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage('assets/backgr.jpg'),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 16),
              children: [
                DashBoardCard(
                  items: 2,
                  cardTitle: 'Pending Complaints',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PendingComplainsScreens()));
                  },
                ),
                DashBoardCard(
                  items: 2,
                  cardTitle: 'In-progress Complaints',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const InProgressComplaintsScreen()));
                  },
                ),
                DashBoardCard(
                  items: 2,
                  cardTitle: 'Completed Complaints',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CompletedComplaintsScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
