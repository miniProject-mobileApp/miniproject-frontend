import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  //get base url
  static const String baseUrl = "http://192.168.186.69:7000";

  Future<Map<String, dynamic>> login({
    required String email,
    required String password
  })async {
    try {
      final response = await http.post(
      Uri.parse('${baseUrl}/api/v1/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password
      })
      );

      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }else{
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['error'] ?? 'login failed';
        throw errorMessage;
      }
    } catch (e) {
      if(e is String){
        throw e;
      }else {
        throw 'Network error ${e.toString()}';
      }
    }
    
  }
}