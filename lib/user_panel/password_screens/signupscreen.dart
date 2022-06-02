import 'package:flutter/material.dart';
import 'package:login/user_panel/dashboard_screens/app_dashboard.dart';

import 'login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [],
                ),
              ),
              TextFormField(
                style: const TextStyle(color: Color.fromARGB(255, 19, 18, 18)),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "First Name",
                  hintText: "Enter Your First Name",
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [],
                ),
              ),
              const TextField(
                style: TextStyle(color: Color.fromARGB(255, 19, 18, 18)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Last Name",
                  hintText: "Enter Your Last Name",
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [],
                ),
              ),
              const TextField(
                style: TextStyle(color: Color.fromARGB(255, 19, 18, 18)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "User Name",
                  hintText: "Enter Your User Name",
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [],
                ),
              ),
              const TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  hintText: "Enter Your Email",
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [],
                ),
              ),
              const TextField(
                style: TextStyle(color: Color.fromARGB(255, 19, 18, 18)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Phone Number",
                  hintText: "Enter Your Phone Number",
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [],
                ),
              ),
              const TextField(
                obscureText: true,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Enter Your Password",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                  child: Container(
                height: 30,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserDashBoardScreen()),
                    );
                  },
                  child: const Text("Register"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff2db0d8)),
                    //const Color.fromARGB(255, 45, 176, 216),)//2DB0D8
                    // textColor: Colors.white,
                    // splashColor: const Color.fromARGB(255, 215, 222, 228),
                  ),
                ),
              )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('already have an account?'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserLoginScreen()),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(const Color(0xff58A870))),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
