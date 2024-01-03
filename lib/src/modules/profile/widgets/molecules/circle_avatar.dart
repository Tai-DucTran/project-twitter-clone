import 'package:flutter/material.dart';

class CircleAvatarInProfile extends StatelessWidget {
  final String imageUrl;
  final bool isDartModeOn;
  const CircleAvatarInProfile({
    super.key,
    required this.imageUrl,
    required this.isDartModeOn,
  });

  static const double ratio = 9 / 4;
  static const double avatarRadius = 50.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: avatarRadius * ratio,
          height: avatarRadius * ratio,
          transform: Matrix4.translationValues(
            -140.0,
            -35.0,
            0.0,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDartModeOn ? Colors.black : Colors.white,
          ),
        ),
        Container(
          transform: Matrix4.translationValues(
            -140.0,
            -30.0,
            0.0,
          ),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              imageUrl,
            ),
            radius: avatarRadius,
          ),
        ),
      ],
    );
  }
}
