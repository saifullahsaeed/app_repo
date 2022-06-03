import 'package:flutter/material.dart';

import 'cms_screen_user_login.dart';

class ChangeUserPassword extends StatefulWidget {
  const ChangeUserPassword({Key? key}) : super(key: key);

  @override
  State<ChangeUserPassword> createState() => _ChangeUserPasswordState();
}

class _ChangeUserPasswordState extends State<ChangeUserPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(209, 255, 247, 247)),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text("Change passward"),
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
      body: Padding(
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
              const TextField(
                style: TextStyle(color: Color.fromARGB(255, 19, 18, 18)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Change Passward",
                  hintText: "Enter Your Change Passward ",
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
                  labelText: "New Password",
                  hintText: "Enter Your New Password",
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
                  labelText: "Re-enter Password",
                  hintText: "Enter Your Re-enter Password",
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [],
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 60,
                  width: 300,
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: ElevatedButton(
                    child: const Text("Save"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff3195D8)),
                        foregroundColor:
                            MaterialStateProperty.all(const Color(0xffE7E7E0))),

                    // color: const Color.fromARGB(255, 49, 149, 216),
                    // textColor: const Color.fromARGB(255, 231, 231, 224),
                    // splashColor: const Color.fromARGB(255, 109, 149, 187),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserLoginScreen()),
                      );
                    },
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
