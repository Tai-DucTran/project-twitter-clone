import 'package:flutter/material.dart';

class UserNameAndTwitterNameSection extends StatelessWidget {
  final String userName;
  final double? userNameHeight;
  final double? twitterNameHeight;

  const UserNameAndTwitterNameSection({
    super.key,
    required this.userName,
    this.userNameHeight = 20,
    this.twitterNameHeight = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userName.toString(),
          style: TextStyle(
            fontSize: userNameHeight,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "@${userName.toString()}",
          style: TextStyle(
            fontSize: twitterNameHeight,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
