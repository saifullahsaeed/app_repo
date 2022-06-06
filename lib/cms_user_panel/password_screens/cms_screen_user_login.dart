import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login/cms_user_panel/password_screens/cms_screen_user_signupscreen.dart';
import 'package:login/components_app/cms_reusable_textfield.dart';
import 'package:login/main.dart';
import 'package:provider/provider.dart';
import '../../providers/userp.dart';
import '../dashboard_screens/cms_screen_user_dashboard.dart';
import 'cms_screen_user_forgot_passward.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  static const routeName =
      '/cms_user_panel/password_screens/cms_screen_user_login';

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.ref().child('Users');
  Future signInUser(BuildContext context, String email, String password) async {
    try {
      final newUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (newUser.user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const UserDashBoardScreen()));
      }
    } on FirebaseAuthException catch (e) {
      displayMessage(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Future<bool?> checkLogin =
        Provider.of<UserP>(context).checkSignedIn(context);
    checkLogin.then((value) {
      if (value != null) {
        if (value) {
          if (kDebugMode) {
            print(value);
          }
          Navigator.pushNamed(context, UserDashBoardScreen.routeName);
        }
      }
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Complaint Management System"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color.fromARGB(225, 10, 24, 35), Colors.blue],
            ),
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage("assets/backgr.jpg"),
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      radius: 70.0,
                      backgroundImage: AssetImage('assets/logoforAPPFinal.PNG'),
                    ),
                    const Text(
                      'Student Login',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    ReusableTextField(
                      icon: Icons.mail,
                      labelText: 'Email/Username',
                      controller: _emailController,
                      obsecureText: false,
                    ),
                    ReusableTextField(
                      icon: Icons.lock,
                      labelText: 'Password',
                      controller: _passwordController,
                      obsecureText: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        TextButton(
                          child: const Text(
                            "Forgot Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xfff11212)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordScreen()),
                            );
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: size.width,
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                      child: ElevatedButton(
                        child: const Text("Login"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xff3195D8),
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                        ),
                        onPressed: () => signInUser(context,
                            _emailController.text, _passwordController.text),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Dont`t have an account?'),
                        TextButton(
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()),
                            );

                            //signup screen
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
