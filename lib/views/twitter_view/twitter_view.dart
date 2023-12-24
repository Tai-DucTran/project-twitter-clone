// Create the main UI of Twitter
import 'package:finalproject/modules/auth/auth_service.dart';
import 'package:finalproject/modules/tweet/fletching_data/fletching_feed_posts.dart';
import 'package:flutter/material.dart';
import '../../constants/routes.dart';

import '../drawer/myheaderdrawer.dart';

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
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue[400],
            onPressed: () {
              Navigator.of(context).pushNamed(addTweetRoute);
            },
            child: const Icon(Icons.add)),
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 15),
          child: const FeedPosts(),
        ),
        drawer: Drawer(
          width: 350,
          backgroundColor: Colors.white,
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                child: MyHeaderDrawer(),
              ),
              ListTile(
                title: const Row(
                  children: [
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
                title: const Row(
                  children: [
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
                  title: const Row(
                    key: Key('logout-button-in-drawer'),
                    children: [
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
                    await showLogOutDialog(context);
                  }),
            ],
          ),
        ));
  }
}

Future<void> showLogOutDialog(BuildContext context) {
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
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(loginRoute, (_) => false);
              await AuthServiceController.firebase().logOut();
            },
            child: const Text('Log out'),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
