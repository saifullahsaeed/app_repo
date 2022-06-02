// main.dart
import 'package:flutter/material.dart';
import 'package:login/components_app/app_drawer.dart';
import 'package:login/main.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Kindacode.com',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _viewFile() async {
    const _url =
        'https://www.kindacode.com/wp-content/uploads/2021/07/test.pdf';
    if (await canLaunchUrl(Uri.parse(_url))) {
      await launchUrl(Uri.parse(_url));
    } else {
      displayMessage('Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Completed_complaint"),
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
        child: ElevatedButton(
          child: const Text('View PDF'),
          onPressed: _viewFile,
        ),
      ),
    );
  }
}
