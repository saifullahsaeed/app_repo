import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login/components_app/cms_reusable_textfield.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../models/users.dart';
import '../../providers/userp.dart';
import '../dashboard_screens/cms_screen_user_dashboard.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firtNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  late String _userImageUrl;
  late final uid;

  final _auth = FirebaseAuth.instance;

  void signUpUser() async {
    try {
      //make new Users object
      var userData = Users(
        fname: _firtNameController.text,
        lname: _lastNameController.text,
        username: _userNameController.text,
        email: _emailController.text,
        phone: _phoneNumberController.text,
        password: _passwordController.text,
      );
      Provider.of<UserP>(context, listen: false).signUpUser(userData);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  @override
  void dispose() {
    super.dispose();
    _firtNameController.dispose();
    _lastNameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPassController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(209, 255, 247, 247)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text("Complaint Management System"),
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
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backgr.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              const Image(
                image: AssetImage('assets/backgr.jpg'),
                fit: BoxFit.cover,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableTextField(
                        obsecureText: false,
                        labelText: 'First Name',
                        icon: Icons.perm_identity,
                        controller: _firtNameController,
                      ),
                      ReusableTextField(
                        obsecureText: false,
                        labelText: "Last Name",
                        icon: Icons.perm_identity,
                        controller: _lastNameController,
                      ),
                      ReusableTextField(
                        obsecureText: false,
                        labelText: "Username",
                        icon: Icons.person,
                        controller: _userNameController,
                      ),
                      ReusableTextField(
                        obsecureText: false,
                        labelText: "Email",
                        icon: Icons.verified_user,
                        controller: _emailController,
                      ),
                      ReusableTextField(
                        obsecureText: false,
                        labelText: "Phone Number",
                        icon: Icons.phone,
                        controller: _phoneNumberController,
                      ),
                      ReusableTextField(
                        obsecureText: true,
                        labelText: "Password",
                        icon: Icons.lock,
                        controller: _passwordController,
                      ),
                      ReusableTextField(
                        obsecureText: true,
                        labelText: "Confirm Password",
                        icon: Icons.lock_clock,
                        controller: _confirmPassController,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: signUpUser,
                            child: const Text("Register"),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Already have an account?'),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
