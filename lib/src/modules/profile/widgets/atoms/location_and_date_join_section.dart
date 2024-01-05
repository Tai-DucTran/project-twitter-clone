import 'package:aries_designs/aries_designs.dart';
import 'package:flutter/material.dart';

class LocationAndDateJoinSection extends StatelessWidget {
  final String location;
  final DateTime createdAt;

  const LocationAndDateJoinSection({
    super.key,
    required this.location,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w300,
        );
    return Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          size: 14,
        ),
        Spacing.sp4,
        Text(
          location,
          style: style,
        ),
        Spacing.sp8,
        const Icon(
          Icons.calendar_month_outlined,
          size: 14,
        ),
        Spacing.sp4,
        Text(
          'Joined at ${createdAt.year.toString()}',
          style: style,
        ),
      ],
    );
  }
}
