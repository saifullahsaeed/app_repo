import 'package:flutter/material.dart';
import 'package:login/options_screen.dart';
import 'package:login/user_panel/complaint_screens/makecomplaint.dart';
import 'package:login/user_panel/dashboard_screens/app_dashboard.dart';
import 'package:login/user_panel/password_screens/change_passward.dart';
import 'package:login/user_panel/user_info_screens/personalinfo.dart';
import 'complaint_card.dart';

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({Key? key}) : super(key: key);

  @override
  State<MyAppDrawer> createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  final ImageProvider? userImage = const NetworkImage(
      'https://media.istockphoto.com/photos/hot-air-balloons-flying-over-the-botan-canyon-in-turkey-picture-id1297349747?s=612x612');

  @override
  Widget build(BuildContext context) {
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
                MaterialPageRoute(builder: (context) => const makecomplaint()),
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
                MaterialPageRoute(builder: (context) => const personalinfo()),
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
                    builder: (context) => const change_Passward()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OptionsScreen()),
              );
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
            children: const [ComplaintCard(), ComplaintCard(), ComplaintCard()],
          ),
        ),
      ),
    );
  }
}

class UserPendingComplainsScreens extends StatefulWidget {
  const UserPendingComplainsScreens({Key? key}) : super(key: key);

  @override
  State<UserPendingComplainsScreens> createState() =>
      _UserPendingComplainsScreensState();
}

class _UserPendingComplainsScreensState
    extends State<UserPendingComplainsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Pending Complaints'),
        centerTitle: true,
      ),
      drawer: const MyAppDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [ComplaintCard(), ComplaintCard(), ComplaintCard()],
          ),
        ),
      ),
    );
  }
}

class UserInProgressComplaintsScreen extends StatefulWidget {
  const UserInProgressComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<UserInProgressComplaintsScreen> createState() =>
      _UserInProgressComplaintsScreenState();
}

class _UserInProgressComplaintsScreenState
    extends State<UserInProgressComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('In Progress User Complaints'),
        centerTitle: true,
      ),
      drawer: const MyAppDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [ComplaintCard(), ComplaintCard(), ComplaintCard()],
          ),
        ),
      ),
    );
  }
}
