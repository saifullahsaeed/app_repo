import 'package:flutter/material.dart';
import 'package:login/components_app/cms_user_app_drawer.dart';

class InProgressComplaints extends StatelessWidget {
  const InProgressComplaints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Inprogress_Complaint"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                Color.fromARGB(226, 42, 123, 189),
                Colors.blue
              ])),
        ),
      ),
      drawer: const MyAppDrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 25, 30, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('Still there is no record'),
            ]),
      ),
    );
  }
}
