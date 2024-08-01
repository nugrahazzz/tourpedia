import 'package:flutter/material.dart';
import 'package:tourpedia/core/app/extensions.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color colors;

  const NextPageButton({
    super.key,
    required this.onPressed,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.all(4.0.wp),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: colors,
      onPressed: onPressed,
      child: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
        size: 32.0,
      ),
    );
  }
}
