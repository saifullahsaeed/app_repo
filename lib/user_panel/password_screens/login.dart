import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/user_panel/dashboard_screens/app_dashboard.dart';
import 'forgotpassward.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUpUser() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: _emailController.text.toString(),
              password: _passwordController.text.toString());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  // @override
  // void initState() {
  //   username.text = ""; //innitail value of text field
  //   password.text = "";
  //   super.initState();
  // }

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
                      'Student Login',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Username/Email",
                            prefixIcon: const Icon(Icons.people),
                            border: myinputborder(),
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            labelText: "Password",
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          )),
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
                                  builder: (context) => const forgotpassward()),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserDashBoardScreen(),
                            ),
                          );
                        },
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
                                  builder: (context) => const login()),
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

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return const OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 66, 160, 189),
          width: 3,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 64, 166, 184),
          width: 3,
        ));
  }

  //create a function like this so that you can use it wherever you want
}
