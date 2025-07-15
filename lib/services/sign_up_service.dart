import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpService {
  static const String baseUrl = "http://192.168.186.69:7000";

  Future<Map<String, dynamic>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone
  }) async {
    try {
      final response = await http.post(
      Uri.parse('$baseUrl/api/v1/auth/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'phone': phone
      })
    );

    if(response.statusCode == 201){
      return jsonDecode(response.body);
    }else {
      final errorData = jsonDecode(response.body);
      final errorMessage = errorData['error'] ?? 'sign up failed';
      throw errorMessage;
    }
    } catch (e) {
      if (e is String){
        throw e;
      }else {
        throw 'Network error ${e.toString()}';
      }
    }
  }
}