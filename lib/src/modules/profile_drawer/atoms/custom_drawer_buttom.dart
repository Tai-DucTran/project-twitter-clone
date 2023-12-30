import 'package:aries_designs/aries_designs.dart';
import 'package:flutter/material.dart';

class CustomDrawerButtom extends StatelessWidget {
  final IconData icon;
  final String buttomText;
  final VoidCallback onButtomClick;

  const CustomDrawerButtom({
    super.key,
    required this.icon,
    required this.buttomText,
    required this.onButtomClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.black54,
              ),
              Spacing.sp8,
              Text(
                buttomText,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          onTap: onButtomClick,
        ),
        Spacing.sp12,
      ],
    );
  }
}
