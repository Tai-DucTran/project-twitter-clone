import 'package:finalproject/src/constants/routes.dart';
import 'package:flutter/material.dart';

class CoverUserSection extends StatelessWidget {
  final String coverPicUrl;
  const CoverUserSection({
    super.key,
    required this.coverPicUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            coverPicUrl,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
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
      ),
    );
  }
}
