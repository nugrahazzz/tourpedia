import 'dart:typed_data';

import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final Uint8List imageData;

  const TestPage({super.key, required this.imageData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Image.memory(
            imageData,
            width: 300,
            height: 300,
          ),
        ));
  }
}
