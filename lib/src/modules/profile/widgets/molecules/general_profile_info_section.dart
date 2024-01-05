import 'package:finalproject/src/modules/profile/widgets/atoms/atoms.dart';
import 'package:flutter/material.dart';

import '../../../profile_drawer/atoms/atoms.dart';

class GeneralProfileInfoSection extends StatelessWidget {
  final String location;
  final DateTime createdAt;
  final int following;
  final int follower;
  final bool isDartModeOn;

  const GeneralProfileInfoSection({
    super.key,
    required this.location,
    required this.createdAt,
    required this.following,
    required this.follower,
    required this.isDartModeOn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: FollowingFollowersSection(
            followingNumber: following,
            followerNumber: follower,
            isDartModeOn: isDartModeOn,
          ),
        ),
      ],
    );
  }
}
