import 'dart:convert';
import 'package:chattle/dev/log.dart';
import 'package:chattle/secret.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<Map<String, dynamic>> post(String message, String userId) async {
    final url = Uri.parse('${Secret.hostUrl}/generate');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Secret.authToken}',
      'User-ID': userId,
    };

    final body = jsonEncode({'prompt': message});

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      Log.logger.e('Failed to get reply: ${response.statusCode}');
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

static Future<void> clearHistory(String userId) async {
    final url = Uri.parse('${Secret.hostUrl}/clear-history');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Secret.authToken}',
      'User-ID': userId,
    };

    final response = await http.delete(url, headers: headers);

    if (response.statusCode == 200) {
      // Optionally handle successful response
      Log.logger.i('Chat history cleared');
    } else {
      Log.logger.e('Failed to clear history: ${response.statusCode}');
      throw Exception('Failed to clear history: ${response.statusCode}');
    }
  }
}
