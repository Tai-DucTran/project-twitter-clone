import 'package:finalproject/src/constants/routes.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: const EdgeInsets.only(bottom: 20),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 27,
          ),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              twitterRoute,
              (route) => false,
            );
          },
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(bottom: 20, right: 20),
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 27,
            ),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://e0.pxfuel.com/wallpapers/691/707/desktop-wallpaper-morgan-codes-minimal-minimalist-code.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
