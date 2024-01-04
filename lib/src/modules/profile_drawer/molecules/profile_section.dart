import 'package:aries_designs/aries_designs.dart';
import 'package:finalproject/src/constants/routes.dart';
import 'package:finalproject/src/modules/profile_drawer/atoms/following_and_followers.dart';
import 'package:finalproject/src/modules/profile_drawer/organism/drawer_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  final userName = FirebaseAuth.instance.currentUser?.displayName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: const CircleAvatar(
            backgroundImage: NetworkImage("https://robohash.org/\$15?set=set2"),
            radius: 25,
          ),
        ),
        Spacing.sp8,
        Text(
          userName.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("@${userName.toString()}"),
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
