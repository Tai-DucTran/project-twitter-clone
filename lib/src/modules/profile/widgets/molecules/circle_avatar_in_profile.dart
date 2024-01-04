import 'package:flutter/material.dart';

class CircleAvatarInProfile extends StatelessWidget {
  final String imageUrl;
  final bool? isDartModeOn;
  final bool hasBackgroundBehind;
  final double radius;
  const CircleAvatarInProfile({
    super.key,
    required this.imageUrl,
    this.isDartModeOn = false,
    required this.radius,
    required this.hasBackgroundBehind,
  });

  static const double ratioRadius = 9 / 4;
  static const double ratioPositionHeight = 7 / 6;

  @override
  Widget build(BuildContext context) {
    const double positionHeight = -25.0;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        hasBackgroundBehind
            ? Container(
                width: radius * ratioRadius,
                height: radius * ratioRadius,
                transform: Matrix4.translationValues(
                  -140.0,
                  positionHeight * ratioPositionHeight,
                  0.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDartModeOn! ? Colors.black : Colors.white,
                ),
              )
            : const Offstage(),
        Container(
          transform: Matrix4.translationValues(
            -140.0,
            positionHeight,
            0.0,
          ),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              imageUrl,
            ),
            radius: radius,
          ),
        ),
      ],
    );
  }
}
