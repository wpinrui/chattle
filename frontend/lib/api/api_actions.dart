import 'package:chattle/api/api.dart';
import 'package:chattle/api/device_id.dart';
import 'package:chattle/dev/log.dart';

class ApiActions {
  static Future<String> getReply(String prompt) async {
    Log.logger.i('Replying to message: $prompt');
    try {
      final responseJson = await Api.post(prompt, await DeviceId.get());
      final String response = responseJson['generated_text'] ?? 'Sorry, I am not able to respond right now.';
      return response;
    } on Exception catch (e) {
      Log.logger.e('Failed to get reply: $e');
      return 'Sorry, I am not able to respond right now.';
    }
  }

  static Future<void> clearHistory() async {
    Log.logger.i('Clearing chat history');
    try {
      await Api.clearHistory(await DeviceId.get());
    } on Exception catch (e) {
      Log.logger.e('Failed to clear chat history: $e');
    }
  }
}
