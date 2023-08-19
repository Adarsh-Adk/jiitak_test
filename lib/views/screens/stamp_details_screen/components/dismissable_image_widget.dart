import 'package:flutter/material.dart';

class DisMissableImageWidget extends StatelessWidget {
  final void Function(String image)? onPressed;
  final String imagePath;
  const DisMissableImageWidget(
      {super.key, required this.onPressed, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Image.asset(imagePath),
            InkWell(
              onTap: () {
                onPressed!(imagePath);
              },
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            )
          ],
        ));
  }
}
