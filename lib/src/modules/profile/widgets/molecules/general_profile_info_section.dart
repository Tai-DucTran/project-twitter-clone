import 'package:finalproject/src/modules/profile/widgets/atoms/atoms.dart';
import 'package:flutter/material.dart';

import '../../../profile_drawer/atoms/atoms.dart';

class GeneralProfileInfoSection extends StatelessWidget {
  final String location;
  final DateTime createdAt;
  final int following;
  final int follower;
  final bool? isDartModeOn;
  final String? intro;

  const GeneralProfileInfoSection({
    super.key,
    this.intro,
    this.isDartModeOn = false,
    required this.location,
    required this.createdAt,
    required this.following,
    required this.follower,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocationAndDateJoinSection(
                location: location,
                createdAt: createdAt,
              ),
              // ),
              Container(
                padding: const EdgeInsets.only(left: 2),
                child: FollowingFollowersSection(
                  followingNumber: following,
                  followerNumber: follower,
                  isDartModeOn: isDartModeOn ?? false,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
