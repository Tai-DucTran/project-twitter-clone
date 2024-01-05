import 'package:aries_designs/aries_designs.dart';
import 'package:finalproject/src/modules/profile/widgets/molecules/molecules.dart';
import 'package:finalproject/src/modules/profile_drawer/atoms/following_and_followers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const String _coverPicUrl =
    'https://e0.pxfuel.com/wallpapers/691/707/desktop-wallpaper-morgan-codes-minimal-minimalist-code.jpg';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final userName = FirebaseAuth.instance.currentUser?.displayName;
    const String profilePic = "https://robohash.org/\$15?set=set2";
    const int following = 0;
    const int follower = 0;
    const bool isDartModeOn = false;
    const String location = 'Vietnam';
    final DateTime createdAt = DateTime(2024, DateTime.december);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const CoverProfileSection(
            coverPicUrl: _coverPicUrl,
          ),
          Container(
            transform: Matrix4.translationValues(
              0.0,
              -25,
              0.0,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AvatarAndEditProfileSection(
                  imageUrl: profilePic,
                ),
                UserNameAndTwitterNameSection(
                  userName: userName ?? '',
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 18),
                child: LocationAndDateJoinSection(
                  location: location,
                  createdAt: createdAt,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: const FollowingFollowersSection(
                  followingNumber: following,
                  followerNumber: follower,
                  isDartModeOn: isDartModeOn,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
