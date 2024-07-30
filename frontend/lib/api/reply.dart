import 'package:chattle/dev/log.dart';

class Reply {
  static String reply(String message) {
    Log.logger.i('Replying to message: $message');
    // send message
    // TODO: Implement actual call
    try {
      return 'Echoing message: $message';
    } catch (e) {
      Log.logger.e('Failed to reply to message: $message');
      return 'Sorry, I am unable to reply to your message';
    }
  }
}
