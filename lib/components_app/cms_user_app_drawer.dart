import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/models/users.dart';
import 'package:login/options_screen.dart';
import 'package:login/providers/userp.dart';
import 'package:provider/provider.dart';
import '../cms_user_panel/complaint_screens/cms_screen_user_makecomplaint.dart';
import '../cms_user_panel/complaint_screens/cms_screen_user_pending.dart';
import '../cms_user_panel/complaint_screens/cms_user_screen_in_progress.dart';
import '../cms_user_panel/dashboard_screens/cms_screen_user_dashboard.dart';
import '../cms_user_panel/password_screens/cms_screen_user_change_passward.dart';
import '../cms_user_panel/user_info_screens/cms_screen_user_personalinfo.dart';
import 'cms_complaint_card.dart';

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({Key? key}) : super(key: key);

  @override
  State<MyAppDrawer> createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  final ImageProvider? userImage = const NetworkImage(
      'https://media.istockphoto.com/photos/hot-air-balloons-flying-over-the-botan-canyon-in-turkey-picture-id1297349747?s=612x612');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const OptionsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final userid = _auth.currentUser?.uid;
    final userData = Provider.of<UserP>(context).getUserInfo(userid!);
    Fluttertoast.showToast(msg: userData.toString());
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          const Center(
            child: UserAccountsDrawerHeader(
              currentAccountPicture: Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('assets/user_image_ph.png'),
                ),
              ),
              accountName: Text("Heerfab5"),
              accountEmail: Text("irsatanoli2000@gmail.com"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text("Dashboard"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserDashBoardScreen()),
              );
            },
          ),
          const Divider(
            height: 30,
            indent: 20,
            endIndent: 20,
            color: Color.fromARGB(255, 194, 185, 185),
          ),
          ListTile(
            leading: const Icon(Icons.file_copy_outlined),
            title: const Text("Make Complaint"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MakeComplaintScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.check_box),
            title: const Text("Completed"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const UserCompletedComplaintsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_bubble),
            title: const Text("Inprogress"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const UserInProgressComplaintsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.pending_actions),
            title: const Text("Pending"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserPendingComplainsScreens()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("Complaint History"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserComplaintsHistoryScreen()),
              );
            },
          ),
          const Divider(
            height: 30,
            indent: 20,
            endIndent: 20,
            color: Color.fromARGB(255, 194, 185, 185),
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text("Edit info"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PersonalInformationScreen()),
              );
            },
          ),
          const Divider(
            height: 30,
            indent: 20,
            endIndent: 20,
            color: Color.fromARGB(255, 194, 185, 185),
          ),
          ListTile(
            leading: const Icon(Icons.password_sharp),
            title: const Text("Change Passward"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChangeUserPassword()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
            onTap: () {
              _signOut(context);
            },
          ),
        ],
      ),
    );
  }
}

class UserComplaintsHistoryScreen extends StatefulWidget {
  const UserComplaintsHistoryScreen({Key? key}) : super(key: key);

  @override
  State<UserComplaintsHistoryScreen> createState() =>
      _UserComplaintsHistoryScreenState();
}

class _UserComplaintsHistoryScreenState
    extends State<UserComplaintsHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Complaints History'),
        centerTitle: true,
      ),
      drawer: const MyAppDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              ComplaintCard(),
              ComplaintCard(),
              ComplaintCard(),
              ComplaintCard(),
              ComplaintCard()
            ],
          ),
        ),
      ),
    );
  }
}

class UserCompletedComplaintsScreen extends StatefulWidget {
  const UserCompletedComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<UserCompletedComplaintsScreen> createState() =>
      _UserCompletedComplaintsScreenState();
}

class _UserCompletedComplaintsScreenState
    extends State<UserCompletedComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Complaints'),
        centerTitle: true,
      ),
      drawer: const MyAppDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              ComplaintCard(),
              ComplaintCard(),
              ComplaintCard(),
              ComplaintCard()
            ],
          ),
        ),
      ),
    );
  }
}
