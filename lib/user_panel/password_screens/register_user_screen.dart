import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:login/main.dart';
import '../../components_app/reusable_textfield.dart';
import 'forgotpassward.dart';
import 'login.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({Key? key}) : super(key: key);

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final databaseReference = FirebaseDatabase.instance.ref().child('Users');

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signUpUser() {
    try {} on FirebaseAuthException catch (e) {
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
                          onPressed: () => signUpUser()),
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
