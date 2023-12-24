import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String imagePath;
  final String descriptionError;
  const ErrorView({
    super.key,
    required this.imagePath,
    required this.descriptionError,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.sizeOf(context).height / 4,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              descriptionError,
              style: textTheme.headlineSmall!.copyWith(
                color: Colors.black38,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
