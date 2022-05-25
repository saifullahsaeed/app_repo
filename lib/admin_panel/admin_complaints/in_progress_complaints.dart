import 'package:flutter/material.dart';

import '../admin_drawer.dart';

class InProgressComplaintsScreen extends StatefulWidget {
  const InProgressComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<InProgressComplaintsScreen> createState() =>
      _InProgressComplaintsScreenState();
}

class _InProgressComplaintsScreenState
    extends State<InProgressComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('In Progress Complaints'),
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
            child: Text('InProgress Complaints Will Appear Here'),
          ),
        ));
  }
}
