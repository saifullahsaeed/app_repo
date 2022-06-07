import 'package:flutter/material.dart';
import 'package:login/components_app/cms_user_app_drawer.dart';
import 'package:login/models/complaints.dart';
import 'package:login/providers/complaintp.dart';
import 'package:provider/provider.dart';

import '../../components_app/cms_dashboard_card.dart';
import '../complaint_screens/cms_screen_user_pending.dart';
import '../complaint_screens/cms_user_screen_in_progress.dart';

class UserDashBoardScreen extends StatefulWidget {
  const UserDashBoardScreen({Key? key}) : super(key: key);
  static const routeName = 'cms_screen_user_dashboard';

  @override
  State<UserDashBoardScreen> createState() => _UserDashBoardScreenState();
}

class _UserDashBoardScreenState extends State<UserDashBoardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<ComplaintP>(context, listen: false).getUserComplaints();
  }

  Widget build(BuildContext context) {
    List<Complain> complaints = Provider.of<ComplaintP>(context).complaints;
    //check no of resolved complaints
    int resolvedComplaints = 0;
    for (var i = 0; i < complaints.length; i++) {
      if (complaints[i].isSolved == true) {
        resolvedComplaints++;
      }
    }
    int pendingComplaints = complaints.length - resolvedComplaints;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Student DashBoard'),
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
                  items: pendingComplaints,
                  cardTitle: 'Pending Complaints',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UserPendingComplainsScreens()));
                  },
                ),
                DashBoardCard(
                  items: pendingComplaints,
                  cardTitle: 'In-progress Complaints',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UserInProgressComplaintsScreen()));
                  },
                ),
                DashBoardCard(
                  items: resolvedComplaints,
                  cardTitle: 'Completed Complaints',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UserCompletedComplaintsScreen()));
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
