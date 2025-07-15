import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:7000";

  Future<Map<String, dynamic>> getData() async{
    final response = await http.get(Uri.parse('$baseUrl/api'));


    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else {
      throw Exception('Failed to load data');
    }
  }
}