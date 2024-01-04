import 'package:flutter/material.dart';

class CircleAvatarInProfile extends StatelessWidget {
  final double positionHeight;
  final String imageUrl;
  final double radius;
  final bool hasBackgroundBehind;
  final bool? isDartModeOn;
  const CircleAvatarInProfile({
    super.key,
    required this.positionHeight,
    required this.imageUrl,
    required this.radius,
    required this.hasBackgroundBehind,
    this.isDartModeOn = false,
  });

  static const double ratioRadius = 9 / 4;
  static const double ratioPositionHeight = 1 / 6;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        hasBackgroundBehind
            ? Container(
                width: radius * ratioRadius,
                height: radius * ratioRadius,
                transform: Matrix4.translationValues(
                  0.0,
                  positionHeight * ratioPositionHeight,
                  0.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDartModeOn! ? Colors.black : Colors.white,
                ),
              )
            : const Offstage(),
        CircleAvatar(
          backgroundImage: NetworkImage(
            imageUrl,
          ),
          radius: radius,
        ),
      ],
    );
  }
}
