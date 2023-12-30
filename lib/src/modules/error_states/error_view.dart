import 'package:aries_designs/aries_designs.dart';
import 'package:flutter/material.dart';

const double _imageWidth = 200.0;
const double _imageHeight = 200.0;
const Color _imageColor = Colors.black54;
const Color _descriptionColor = Colors.black38;

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
              width: _imageWidth,
              height: _imageHeight,
              fit: BoxFit.fill,
              color: _imageColor,
            ),
            Spacing.sp8,
            Text(
              descriptionError,
              style: textTheme.headlineSmall!.copyWith(
                color: _descriptionColor,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
