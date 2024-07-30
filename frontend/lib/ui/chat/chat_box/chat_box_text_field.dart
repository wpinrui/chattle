import 'package:flutter/material.dart';

class ChatBoxTextField extends StatelessWidget {
  final TextEditingController _controller;

  const ChatBoxTextField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;


  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Message',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.w400
        ),
      ),
      controller: _controller,
    );
  }
}
