import 'package:flutter/material.dart';

import '../admin_drawer.dart';

class CompletedComplaintsScreen extends StatefulWidget {
  const CompletedComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<CompletedComplaintsScreen> createState() =>
      _CompletedComplaintsScreenState();
}

class _CompletedComplaintsScreenState extends State<CompletedComplaintsScreen> {
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
      body: const Center(
        child: Text('Completed Complaints Will Appear Here'),
      ),
    );
  }
}
