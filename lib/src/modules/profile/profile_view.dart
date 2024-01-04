import 'package:finalproject/src/modules/profile/widgets/molecules/cover_user_section.dart';
import 'package:flutter/material.dart';

import 'widgets/molecules/circle_avatar_in_profile.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: const [
          CoverUserSection(
            coverPicUrl: _coverPicUrl,
          ),
          CircleAvatarInProfile(
            imageUrl: "https://robohash.org/\$15?set=set2",
            radius: 45.0,
            hasBackgroundBehind: true,
          ),
        ],
      ),
    );
  }
}
