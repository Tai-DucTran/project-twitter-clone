import 'package:aries_designs/aries_designs.dart';
import 'package:finalproject/src/modules/profile/widgets/molecules/molecules.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const String _coverPicUrl =
    'https://e0.pxfuel.com/wallpapers/691/707/desktop-wallpaper-morgan-codes-minimal-minimalist-code.jpg';
const String _intro =
    'Hello world, this is Tai Tran, here is my test account. And I do not know what should I say about me';

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
          const UserIntroductionSection(
            intro: _intro,
          ),
          GeneralProfileInfoSection(
            // intro: _intro,
            location: location,
            createdAt: createdAt,
            follower: follower,
            following: following,
            isDartModeOn: isDartModeOn,
          ),
        ],
      ),
    );
  }
}
