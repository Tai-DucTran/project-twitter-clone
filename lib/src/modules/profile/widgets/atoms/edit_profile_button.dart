import 'package:flutter/material.dart';

class EditProfileButton extends StatelessWidget {
  final VoidCallback onPressed;
  const EditProfileButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      padding: const EdgeInsets.only(top: 20, left: 35),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          'Edit profile',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
