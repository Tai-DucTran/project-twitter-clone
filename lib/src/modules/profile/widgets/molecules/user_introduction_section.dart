import 'package:aries_designs/aries_designs.dart';
import 'package:flutter/material.dart';

class UserIntroductionSection extends StatelessWidget {
  final String? intro;
  const UserIntroductionSection({
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 19,
                ),
                child: Text(
                  intro ?? '',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              Spacing.sp8,
            ],
          )
        : const Offstage();
  }
}
