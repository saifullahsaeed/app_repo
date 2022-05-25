import 'package:flutter/material.dart';
import 'package:login/password_screens/verfication.dart';

class forgotpassward extends StatefulWidget {
  const forgotpassward({Key? key}) : super(key: key);

  @override
  State<forgotpassward> createState() => _forgotpasswardState();
}

class _forgotpasswardState extends State<forgotpassward> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Fogot Passward"),
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(209, 255, 249, 249)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 26,
              color: Color.fromARGB(255, 43, 75, 129),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Enter your Email Address or username\n linked to your account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: TextFormField(
              style: const TextStyle(color: Color.fromARGB(255, 12, 11, 11)),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Send an Email',
                prefixIcon: Icon(
                  Icons.mail,
                  color: Color.fromARGB(255, 14, 13, 13),
                ),
                labelStyle: TextStyle(color: Color.fromARGB(255, 15, 15, 15)),
                hintStyle: TextStyle(color: Color.fromARGB(255, 12, 12, 12)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: TextFormField(
              style: const TextStyle(color: Color.fromARGB(255, 12, 11, 11)),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Send an SMS Message',
                prefixIcon: Icon(
                  Icons.phone_android,
                  color: Color.fromARGB(255, 14, 13, 13),
                ),
                labelStyle: TextStyle(color: Color.fromARGB(255, 15, 15, 15)),
                hintStyle: TextStyle(color: Color.fromARGB(255, 12, 12, 12)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text(
                    'Need more help?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 60,
            width: size.width,
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: ElevatedButton(
              child: const Text("Send"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xff3195D8),
                  ),
                  foregroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 249, 249, 249))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const verification()));
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
