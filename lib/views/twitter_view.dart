// Create the main UI of Twitter
import 'package:finalproject/services/auth/auth_service.dart';
import 'package:finalproject/services/tweet/fletching_data/fletching_feed_posts.dart';
import 'package:flutter/material.dart';
import '../constants/routes.dart';

import 'drawer/myheaderdrawer.dart';

class Twitter extends StatefulWidget {
  const Twitter({super.key});

  @override
  State<Twitter> createState() => _TwitterState();
}

class _TwitterState extends State<Twitter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
        ),
        // Adding-Tweet Button
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(addTweetRoute);
            },
            child: const Icon(Icons.add)),
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 15),
          child: const FeedPosts(),
        ),
        // Create the drawer
        drawer: Drawer(
          width: 350,
          backgroundColor: Colors.white,
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                child: MyHeaderDrawer(),
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 40,
                      color: Colors.black,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(profileRoute, (route) => false);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(
                      Icons.admin_panel_settings_outlined,
                      size: 40,
                      color: Colors.black,
                    ),
                    Text(
                      'Edit Profile Testing',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      editProfileRoute, (route) => false);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              ListTile(
                  title: Row(
                    key: const Key('logout-button-in-drawer'),
                    children: const [
                      Icon(
                        Icons.logout_outlined,
                        size: 40,
                        color: Colors.black,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onTap: () async {
                    final shouldLogout = await showLogOutDialog(context);
                    if (shouldLogout) {
                      await AuthService.firebase().logOut();
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(loginRoute, (_) => false);
                    }
                  }),
            ],
          ),
        ));
  }
}

// Create the logout dialog:
// AlertDiaglog => create dialog
Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        key: const Key('alert-dialog-drawer'),
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Log out'),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
