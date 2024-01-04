import 'package:finalproject/src/modules/profile/widgets/atoms/atoms.dart';
import 'package:flutter/material.dart';

class CoverProfileSection extends StatelessWidget {
  final String coverPicUrl;
  const CoverProfileSection({
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
      child: const IconButtonsInCoverProfile(),
    );
  }
}
