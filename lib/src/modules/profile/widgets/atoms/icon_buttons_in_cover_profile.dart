import 'package:finalproject/src/constants/routes.dart';
import 'package:flutter/material.dart';

class IconButtonsInCoverProfile extends StatelessWidget {
  const IconButtonsInCoverProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 2,
        right: 4,
        left: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 26,
            ),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                twitterRoute,
                (route) => false,
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 26,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
