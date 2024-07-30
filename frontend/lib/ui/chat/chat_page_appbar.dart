import 'package:chattle/const.dart';
import 'package:chattle/ui/chat/chat_profile.dart';
import 'package:chattle/ui/spacers/spacers.dart';
import 'package:flutter/material.dart';

class ChatPageAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  const ChatPageAppbar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 70,
        leadingWidth: 70,
        leading: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HorizontalSpacer(size: 12),
            ChatProfile(
              path: Constants.womanProfilePath,
              radius: 25,
            ),
          ],
        ),
        title: Text(name),
        backgroundColor: Colors.blue.shade300,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(70);
}