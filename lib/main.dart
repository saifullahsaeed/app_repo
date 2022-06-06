import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/cms_user_panel/complaint_screens/cms_screen_user_makecomplaint.dart';
import 'package:login/cms_user_panel/dashboard_screens/cms_screen_user_dashboard.dart';
import 'package:login/cms_user_panel/password_screens/cms_screen_user_login.dart';
import 'package:login/options_screen.dart';
import 'package:login/providers/userp.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserP(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          routes: {
            UserLoginScreen.routeName: (context) => const UserLoginScreen(),
            UserDashBoardScreen.routeName: (context) =>
                const UserDashBoardScreen(),
          },
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
            navigator: const UserLoginScreen(),
            durationInSeconds: 1,
          )),
    );
  }
}
