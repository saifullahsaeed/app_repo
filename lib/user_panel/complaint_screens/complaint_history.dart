import 'package:flutter/material.dart';
import 'package:login/components_app/app_drawer.dart';

class complaint_history extends StatefulWidget {
  const complaint_history({Key? key}) : super(key: key);

  @override
  State<complaint_history> createState() => _complaint_historyState();
}

class _complaint_historyState extends State<complaint_history> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Complaint_History"),
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
