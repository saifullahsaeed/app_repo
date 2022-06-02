import 'package:flutter/material.dart';
import 'package:login/admin_panel/admin_drawer.dart';
import 'package:login/components_app/complaint_card.dart';

class PendingComplainsScreens extends StatefulWidget {
  const PendingComplainsScreens({
    Key? key,
  }) : super(key: key);

  @override
  State<PendingComplainsScreens> createState() =>
      _PendingComplainsScreensState();
}

class _PendingComplainsScreensState extends State<PendingComplainsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Pending Complaints'),
        centerTitle: true,
        leading: IconButton(
            splashRadius: 25,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      drawer: const AdminDrawer(),
      body:
          const SafeArea(child: SingleChildScrollView(child: ComplaintCard())),
    );
  }
}
