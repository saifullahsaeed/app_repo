import 'package:flutter/material.dart';
import 'package:login/components_app/cms_user_app_drawer.dart';

import '../../components_app/cms_dashboard_card.dart';
import '../complaint_screens/cms_screen_user_pending.dart';
import '../complaint_screens/cms_user_screen_in_progress.dart';

class UserDashBoardScreen extends StatefulWidget {
  const UserDashBoardScreen({Key? key}) : super(key: key);

  @override
  State<UserDashBoardScreen> createState() => _UserDashBoardScreenState();
}

class _UserDashBoardScreenState extends State<UserDashBoardScreen> {
  @override
  Widget build(BuildContext context) {
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
                  items: 2,
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
                  items: 2,
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
                  items: 2,
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
