import 'package:flutter/material.dart';

import 'admin_panel/admin_login.dart';
import 'cms_user_panel/password_screens/cms_screen_user_login.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(226, 42, 123, 189),
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              const Image(
                image: AssetImage('assets/backgr.jpg'),
                fit: BoxFit.cover,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AdminLoginScreen()));
                        },
                        child: Column(
                          children: const [
                            SizedBox(
                              width: 200,
                              height: 200,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/employe.png'),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'Admin Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 50,
                        color: Colors.blue,
                        endIndent: 50,
                        indent: 50,
                      ),
                      InkWell(
                        splashColor: Colors.blue,
                        highlightColor: Colors.blue.withOpacity(0.4),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserLoginScreen(),
                            ),
                          );
                        },
                        child: Column(
                          children: const [
                            SizedBox(
                              width: 200,
                              height: 200,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/user_image_ph.png'),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'Student Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
