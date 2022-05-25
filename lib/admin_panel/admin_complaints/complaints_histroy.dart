import 'package:flutter/material.dart';

import '../admin_drawer.dart';

class ComplaintsHistoryScreen extends StatefulWidget {
  const ComplaintsHistoryScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintsHistoryScreen> createState() =>
      _ComplaintsHistoryScreenState();
}

class _ComplaintsHistoryScreenState extends State<ComplaintsHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaints Complaints'),
        centerTitle: true,
        leading: IconButton(
            splashRadius: 25,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      drawer: const AdminDrawer(),
      body: const Center(
        child: Text('Complaints histroy Will Appear Here'),
      ),
    );
  }
}
