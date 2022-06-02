import 'package:flutter/material.dart';
import 'package:login/components_app/app_drawer.dart';

class PendingInformationScreen extends StatefulWidget {
  const PendingInformationScreen({Key? key}) : super(key: key);

  @override
  State<PendingInformationScreen> createState() =>
      _PendingInformationScreenState();
}

class _PendingInformationScreenState extends State<PendingInformationScreen> {
  get iconSize => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Pending_complaint"),
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
        body: Center(
            child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.all(50),
            child: Table(
              border: TableBorder.all(
                  color: Colors.black, style: BorderStyle.solid, width: 2),
              children: [
                TableRow(children: [
                  Column(children: const [
                    Text('Number'),
                  ]),
                  Column(children: const [
                    Text('Category'),
                  ]),
                  Column(children: const [
                    Text('Sub-Category'),
                  ]),
                  Column(children: const [
                    Text('Nature'),
                  ]),
                  Column(children: const [
                    Text('Date & Time'),
                  ]),
                  Column(children: const [
                    Text('File'),
                  ]),
                  Column(children: const [
                    Text('Complaint'),
                  ]),
                ]),
                const TableRow(children: [
                  Text('1'),
                  Text('Faculty'),
                  Text('attendence'),
                  Text('sir xyz'),
                  Text('Apr 17,2022,8:26pm'),
                  Text('view file'),
                  Text('Sir too late/or write whatever'),
                ]),
                const TableRow(children: [
                  Text('1'),
                  Text('Faculty'),
                  Text('attendence'),
                  Text('sir xyz'),
                  Text('Apr 17,2022,8:26pm'),
                  Text('view file'),
                  Text('Sir too late/or write whatever'),
                ]),
              ],
            ),
          ),
        ])));
  }
}
