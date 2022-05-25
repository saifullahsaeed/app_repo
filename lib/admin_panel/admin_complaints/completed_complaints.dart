import 'package:flutter/material.dart';

import '../admin_drawer.dart';

class AdminCompletedComplaintsScreen extends StatefulWidget {
  const AdminCompletedComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<AdminCompletedComplaintsScreen> createState() =>
      _AdminCompletedComplaintsScreenState();
}

class _AdminCompletedComplaintsScreenState
    extends State<AdminCompletedComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Complaints'),
        centerTitle: true,
        leading: IconButton(
            splashRadius: 25,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      drawer: const AdminDrawer(),
      body: const SingleChildScrollView(
        child: Center(
          child: Text('Completed Complaints Will Appear Here'),
        ),
      ),
    );
  }
}
