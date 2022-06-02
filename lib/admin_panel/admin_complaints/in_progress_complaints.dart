import 'package:flutter/material.dart';
import 'package:login/components_app/complaint_card.dart';

import '../admin_drawer.dart';

class InProgressComplaintsScreen extends StatefulWidget {
  const InProgressComplaintsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<InProgressComplaintsScreen> createState() =>
      _InProgressComplaintsScreenState();
}

class _InProgressComplaintsScreenState
    extends State<InProgressComplaintsScreen> {
  @override
  void initState() {
    super.initState();
  }

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
        body: SingleChildScrollView(
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: const [
                ComplaintCard(),
                ComplaintCard(),
                ComplaintCard(),
                ComplaintCard(),
              ]),
            ),
          ),
        ));
  }
}
