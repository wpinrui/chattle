import 'package:chattle/api/api.dart';
import 'package:chattle/dev/log.dart';

class Reply {
  static Future<String> getReply(String prompt) async {
    Log.logger.i('Replying to message: $prompt');
    try {
      final responseJson = await Api.get(prompt);
      final String response = responseJson['generated_text'] ?? 'Sorry, I am not able to respond right now.';
      return removePromptFromReply(prompt, response);
    } on Exception catch (e) {
      Log.logger.e('Failed to get reply: $e');
      return 'Sorry, I am not able to respond right now.';
    }
  }

  static String removePromptFromReply(String prompt, String response) {
    if (response.length < prompt.length * 1.5) {
      return response.trim();
    }
    return response.replaceAll(prompt, '').trim();
  }
}
