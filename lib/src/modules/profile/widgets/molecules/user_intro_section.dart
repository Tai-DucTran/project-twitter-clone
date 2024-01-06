import 'package:aries_designs/aries_designs.dart';
import 'package:flutter/material.dart';

class UserIntroSection extends StatelessWidget {
  final String? intro;
  const UserIntroSection({
    super.key,
    this.intro,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasIntro = intro?.isNotEmpty ?? false;
    return hasIntro
        ? Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 19),
                child: Text(
                  intro ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Spacing.sp8,
            ],
          )
        : const Offstage();
  }
}
