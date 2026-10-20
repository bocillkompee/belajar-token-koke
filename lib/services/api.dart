import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {

  // ATRIBUT
  static const String _baseUrl = "https://localhost:3000/api";
  static const String _tokenKey = "token";

  // METHOD 1
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // METHOD 2
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // METHOD 3
  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  // METHOD 4
  static Future<Map<String, String>> Headers() async {
    final token = await getToken();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) "Authorization": 'Bearer $token'
    };
  }
  static dynamic _handleResponse(http.Response response) {
    final body = response.body.isNotEmpty ? jsonDecode(response.body)
        : null;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    }
    final message = body is Map ? body['message'] : null;
    throw Exception(message ?? 'Terjadi kesalahan');
  }
  static Future<dynamic> post(
    String endpoint, 
    Map<String, dynamic> data
  ) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: await Headers(),
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }
} 