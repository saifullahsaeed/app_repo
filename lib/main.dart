import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/options_screen.dart';

displayMessage(String message) {
  Fluttertoast.showToast(msg: message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: EasySplashScreen(
          backgroundImage: const AssetImage(
            'assets/backgr.jpg',
          ),
          logo: const Image(
            image: AssetImage('assets/logoforAPPFinal.PNG'),
          ),
          logoSize: 100,
          title: const Text(
            "Complaint Management System",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.grey.shade400,
          showLoader: true,
          loadingText: const Text("Loading..."),
          navigator: const OptionsScreen(),
          durationInSeconds: 1,
        ));
  }
}
