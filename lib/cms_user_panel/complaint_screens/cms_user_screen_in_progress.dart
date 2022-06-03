import 'package:flutter/material.dart';

import '../../components_app/cms_user_app_drawer.dart';
import '../../components_app/cms_complaint_card.dart';

class UserInProgressComplaintsScreen extends StatefulWidget {
  const UserInProgressComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<UserInProgressComplaintsScreen> createState() =>
      _UserInProgressComplaintsScreenState();
}

class _UserInProgressComplaintsScreenState
    extends State<UserInProgressComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('In Progress User Complaints'),
        centerTitle: true,
      ),
      drawer: const MyAppDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              ComplaintCard(),
              ComplaintCard(),
              ComplaintCard(),
              ComplaintCard(),
            ],
          ),
        ),
      ),
    );
  }
}
