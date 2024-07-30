import 'dart:ui';

import 'package:flutter/material.dart';

class Frosted extends StatelessWidget {
  final Widget child;

  const Frosted({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.white.withOpacity(0.2),
          child: child,
        ),
      ),
    );
  }
}
