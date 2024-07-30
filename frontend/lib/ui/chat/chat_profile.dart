import 'package:flutter/material.dart';

class ChatProfile extends StatelessWidget {
  final String path;
  final double radius;
  const ChatProfile({super.key, required this.path, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(path),
      backgroundColor: Colors.white,
    );
  }
}
