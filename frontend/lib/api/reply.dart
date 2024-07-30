import 'package:chattle/dev/log.dart';

class Reply {
  static Future<String> reply(String message) async {
    Log.logger.i('Replying to message: $message');
    // send message
    // TODO: Implement actual call
    try {
      // sleep for 1 second to simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      return 'Echoing message: $message';
    } catch (e) {
      Log.logger.e('Failed to reply to message: $message');
      return 'Sorry, I am unable to reply to your message';
    }
  }
}
