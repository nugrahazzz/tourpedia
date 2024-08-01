import 'package:flutter/material.dart';

class Ripple extends StatelessWidget {
  final double radius;
  final Color color;

  const Ripple({
    super.key,
    required this.radius,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      left: (screenWidth / 2) - (1.5 * radius),
      top: (screenHeight / 2) - (1.5 * radius),
      child: Container(
        width: 3 * radius,
        height: 3 * radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
