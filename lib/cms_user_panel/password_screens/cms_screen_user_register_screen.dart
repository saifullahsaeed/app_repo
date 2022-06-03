import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/main.dart';
import '../../components_app/cms_reusable_textfield.dart';
import '../dashboard_screens/cms_screen_user_dashboard.dart';
import 'cms_screen_user_forgot_passward.dart';
import 'cms_screen_user_login.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({Key? key}) : super(key: key);

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  late final uid;
  void signUpUser({required String email, required String password}) async {
    try {
      final newUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (newUser.user != null) {
        uid = _auth.currentUser!.uid;

        Map<String, dynamic> userData = {
          'uid': uid,
          'email': _emailController.text,
          'password': _passwordController.text,
          'role': 'user',
        };

        FirebaseFirestore.instance
            .collection('Users')
            .doc(uid.toString())
            .set(userData);

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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      'Student Registration',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    ReusableTextField(
                      controller: _userNameController,
                      labelText: 'Username',
                      icon: Icons.person,
                    ),
                    ReusableTextField(
                      controller: _emailController,
                      labelText: 'Email',
                      icon: Icons.mail,
                    ),
                    ReusableTextField(
                      controller: _passwordController,
                      labelText: 'Password',
                      icon: Icons.lock,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        TextButton(
                          child: const Text(
                            " Forgot Password",
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
                          child: const Text("Register"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xff3195D8),
                            ),
                            foregroundColor: MaterialStateProperty.all(
                              Colors.white,
                            ),
                          ),
                          onPressed: () => signUpUser(
                              email: _emailController.text,
                              password: _passwordController.text)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Already have an account?'),
                        TextButton(
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const UserLoginScreen()),
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
