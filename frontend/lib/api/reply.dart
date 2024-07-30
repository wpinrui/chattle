import 'dart:convert';

import 'package:chattle/dev/log.dart';
import 'package:chattle/secret.dart';
import 'package:http/http.dart' as http;

class Reply {
  static Future<String> getReply(String message) async {
    Log.logger.i('Replying to message: $message');

    final url = Uri.parse(
        '${Secret.hostUrl}/generate'); // Replace with your actual endpoint
    final headers = {'Content-Type': 'application/json'};
    final body =
        jsonEncode({'prompt': message}); // Use 'prompt' instead of 'message'

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        Log.logger.i(responseData.toString());
        return removePromptFromReply(
            message,
            responseData[
                'generated_text']); // Adjust according to your backend response format
      } else {
        Log.logger.e(
            'Failed to reply to message: $message with status code: ${response.statusCode}');
        return 'Sorry, I am unable to reply to your message.';
      }
    } catch (e) {
      Log.logger.e('Failed to reply to message: $message with error: $e');
      return 'Sorry, I am unable to reply to your message.';
    }
  }

  static String removePromptFromReply(String prompt, String reply) {
    if (reply.length < prompt.length * 1.5) {
      return reply.trim();
    }
    return reply.replaceAll(prompt, '').trim();
  }
}
