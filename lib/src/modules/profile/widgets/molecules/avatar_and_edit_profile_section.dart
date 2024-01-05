import 'package:finalproject/src/constants/routes.dart';
import 'package:finalproject/src/modules/profile/widgets/atoms/atoms.dart';
import 'package:flutter/material.dart';

class AvatarAndEditProfileSection extends StatelessWidget {
  final String imageUrl;
  final bool? isDartModeOn;

  const AvatarAndEditProfileSection({
    super.key,
    required this.imageUrl,
    this.isDartModeOn = false,
  });

  @override
  Widget build(BuildContext context) {
    const double positionHeight = -25.0;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatarInProfile(
          positionHeight: positionHeight,
          imageUrl: imageUrl,
          radius: 40.0,
          hasBackgroundBehind: true,
        ),
        EditProfileButton(
          onPressed: () {
            Navigator.of(context).pushNamed(editProfileRoute);
          },
        )
      ],
    );
  }
}
