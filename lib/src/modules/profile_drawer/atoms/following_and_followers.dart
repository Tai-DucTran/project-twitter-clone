import 'package:aries_designs/aries_designs.dart';
import 'package:flutter/material.dart';

class FollowingFollowersSection extends StatelessWidget {
  final int followingNumber;
  final int followerNumber;
  final bool isDartModeOn;

  const FollowingFollowersSection({
    super.key,
    required this.followingNumber,
    required this.followerNumber,
    required this.isDartModeOn,
  });

  @override
  Widget build(BuildContext context) {
    final Color numberTextColor = isDartModeOn ? Colors.white : Colors.black;
    final TextStyle numberTextStyle = Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(color: numberTextColor, fontWeight: FontWeight.bold);

    final TextStyle followingFollowerTextStyle = Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(color: Colors.black, fontWeight: FontWeight.w300);

    return Row(
      children: [
        Text(
          '$followingNumber',
          style: numberTextStyle,
        ),
        Spacing.sp4,
        Text(
          'Following',
          style: followingFollowerTextStyle,
        ),
        Spacing.sp8,
        Text(
          '$followerNumber',
          style: numberTextStyle,
        ),
        Spacing.sp4,
        Text(
          'Followers',
          style: followingFollowerTextStyle,
        ),
      ],
    );
  }
}
