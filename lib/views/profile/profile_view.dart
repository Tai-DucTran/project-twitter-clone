import 'package:finalproject/constants/routes.dart';
import 'package:finalproject/services/tweet/post_services/post_services.dart';
import 'package:flutter/material.dart';

import '../../services/tweet/fletching_data/fletching_user_post.dart';

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
            padding: const EdgeInsets.only(top: 50, left: 4, right: 4),
            child: Column(children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        twitterRoute,
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
              const Expanded(child: FletchingUserPosts())
            ])));
  }
}
