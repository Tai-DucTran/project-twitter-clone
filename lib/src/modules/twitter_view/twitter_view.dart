import 'package:aries_designs/aries_designs.dart';
import 'package:finalproject/src/modules/auth/controllers/auth_service_controller.dart';
import 'package:finalproject/src/modules/profile_drawer/organism/drawer_profile.dart';
import 'package:finalproject/src/modules/tweet/fletching_data/fletching_feed_posts.dart';
import 'package:flutter/material.dart';
import '../../constants/routes.dart';

class TwitterView extends StatefulWidget {
  const TwitterView({super.key});

  @override
  State<TwitterView> createState() => _TwitterViewState();
}

class _TwitterViewState extends State<TwitterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: AriesImages.appLogo,
        leading: Builder(
          builder: (context) => IconButton(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            icon: const CircleAvatar(
              backgroundImage:
                  NetworkImage("https://robohash.org/\$15?set=set2"),
              radius: 25,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[400],
          onPressed: () {
            Navigator.of(context).pushNamed(addTweetRoute);
          },
          child: const Icon(Icons.add)),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 10,
          top: 15,
        ),
        child: ListView(
          children: const [
            FeedPosts(),
          ],
        ),
      ),
      drawer: const DrawerProfile(),
    );
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
