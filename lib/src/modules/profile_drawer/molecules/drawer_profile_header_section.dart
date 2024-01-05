import 'package:aries_designs/aries_designs.dart';
import 'package:finalproject/src/constants/routes.dart';
import 'package:finalproject/src/modules/profile_drawer/atoms/following_and_followers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerProfileHeaderSection extends StatefulWidget {
  const DrawerProfileHeaderSection({super.key});

  @override
  State<DrawerProfileHeaderSection> createState() =>
      _DrawerProfileHeaderSectionState();
}

class _DrawerProfileHeaderSectionState
    extends State<DrawerProfileHeaderSection> {
  final userName = FirebaseAuth.instance.currentUser?.displayName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(profileRoute, (route) => false);
          },
          child: const CircleAvatar(
            backgroundImage: NetworkImage("https://robohash.org/\$15?set=set2"),
            radius: 25,
          ),
        ),
        Spacing.sp8,
        UserNameAndTwitterNameSection(
          userName: userName ?? 'user_name',
          userNameHeight: 16,
          twitterNameHeight: 12,
        ),
        Spacing.sp8,
        const FollowingFollowersSection(
          followingNumber: 1,
          followerNumber: 1,
          isDartModeOn: false,
        )
      ],
    );
  }
}
