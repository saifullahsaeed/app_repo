import 'package:flutter/material.dart';
import 'package:login/components_app/complaint_card.dart';

import '../admin_drawer.dart';

class AdminComplaintsHistoryScreen extends StatefulWidget {
  const AdminComplaintsHistoryScreen({Key? key}) : super(key: key);

  @override
  State<AdminComplaintsHistoryScreen> createState() =>
      _AdminComplaintsHistoryScreenState();
}

class _AdminComplaintsHistoryScreenState
    extends State<AdminComplaintsHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaints History'),
        centerTitle: true,
        leading: IconButton(
            splashRadius: 25,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      drawer: const AdminDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: const [
                ComplaintCard(),
                ComplaintCard(),
                ComplaintCard(),
                ComplaintCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
