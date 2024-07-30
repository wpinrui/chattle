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
      minLines: 1,
      maxLines: 4,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Message',
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 18,
          fontWeight: FontWeight.w400
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w400
      ),
      controller: _controller,
    );
  }
}
