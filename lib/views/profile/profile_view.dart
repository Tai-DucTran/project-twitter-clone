import 'package:finalproject/constants/routes.dart';
import 'package:finalproject/services/tweet/postservices.dart';
import 'package:flutter/material.dart';

import '../../services/tweet/userpost.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final PostService _postService = PostService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        twitterRoute,
                        (route) => false,
                      );
                    },
                    child: const Text('Back'),
                  ),
                  Expanded(
                      child: TextButton(
                    onPressed: () {
                      _postService.readUserPosts();
                    },
                    child: const Text(
                      'Check Up!',
                    ),
                  ))
                ],
              ),
              const Expanded(child: UserPosts())
            ])));
  }
}
