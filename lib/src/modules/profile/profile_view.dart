import 'package:finalproject/src/modules/profile/widgets/molecules/molecules.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: const [
          CoverProfileSection(
            coverPicUrl: _coverPicUrl,
          ),
          AvatarAndEditProfileSection(
            imageUrl: "https://robohash.org/\$15?set=set2",
          ),
        ],
      ),
    );
  }
}
