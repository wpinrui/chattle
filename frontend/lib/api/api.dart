import 'dart:convert';

import 'package:chattle/secret.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<Map<String, String>> get(String message) async {
    final url = Uri.parse(
        '${Secret.hostUrl}/generate'); // Replace with your actual endpoint
    final headers = {'Content-Type': 'application/json'};
    final body =
        jsonEncode({'prompt': message}); // Use 'prompt' instead of 'message'

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: url.toString()),
          response: Response(
            statusCode: response.statusCode,
            data: response.body,
            requestOptions: RequestOptions(path: url.toString()),
          ),
        );
      }
  }
}
