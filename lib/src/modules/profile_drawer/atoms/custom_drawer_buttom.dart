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
              const SizedBox(
                width: 8,
              ),
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
        const SizedBox(height: 12),
      ],
    );
  }
}
