// Create the main UI of Twitter
import 'package:finalproject/services/auth/auth_service.dart';
import 'package:finalproject/services/tweet/feedposts.dart';
import 'package:flutter/material.dart';
import '../constants/routes.dart';
import '../emums/menu_action.dart';
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
          actions: [
            PopupMenuButton<MenuAction>(
              onSelected: (value) async {
                switch (value) {
                  case MenuAction.logout:
                    final shouldLogout = await showLogOutDialog(context);
                    if (shouldLogout) {
                      await AuthService.firebase().logOut();
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(loginRoute, (_) => false);
                    }
                }
              },
              itemBuilder: (context) {
                return const [
                  // Create a Poppup MenuItem
                  PopupMenuItem<MenuAction>(
                    value: MenuAction.logout,
                    child: Text('Log out'),
                  )
                ];
              },
            )
          ],
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
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(profileRoute, (route) => false);
                },
              ),
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
