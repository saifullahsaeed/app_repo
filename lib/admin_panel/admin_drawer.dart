import 'package:flutter/material.dart';

import 'admin_dashboard/admin_dashboard.dart';
import 'admin_dashboard/manage_complaints_screen.dart';
import 'admin_login.dart';

class AdminDrawer extends StatefulWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
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
              accountName: Text("Admin"),
              accountEmail: Text("Admin@admin.com"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text("Dashboard"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminDashBoard()),
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
            title: const Text("Manage Complaint"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ManageComplaints()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AdminLoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
