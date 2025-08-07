import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/utils/auth_storage.dart';
import 'package:http/http.dart' as http;



class AuthProvider with ChangeNotifier {
  String? _token;
  bool _isAuthenticated = false;
  String? _userName;
  int? _userStreak;
  String? _error;

  //Getters
  String? get token => _token;
  bool get isAuthenticated => _isAuthenticated;
  String? get userName => _userName;
  int? get userStreak => _userStreak;
  String? get error => _error;


  //Initialize authentication state
  Future<void> checkAuthStatus()  async {
    _token = await AuthStorage.getToken();
    print("Token received: ${_token}");
    _isAuthenticated = _token != null;
    if(_isAuthenticated) {
      // fetch user profile
      await _fetchUserProfile();
    }
    print("Auth status: isAuthenticated=$_isAuthenticated, userName=$_userName, streak=$_userStreak");
    notifyListeners(); // used to keep the UI in sync with AuthProvider class
  }


  //login method
  Future<void> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.186.69:7000/api/v1/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password})
      );

      final responseData = jsonDecode(response.body);

      if(response.statusCode == 200 && responseData['accessToken'] != null){
        _token = responseData['accessToken'];
        await AuthStorage.saveToken(_token!); // why is there exclamation mark
        print("Token saved ${_token}");

        //user data from login
        _userName = responseData['user']?['firstName'] ?? "Unknown user";

        _isAuthenticated = true;
        _error = null;

        await _fetchStreak();
      } else {
        _error = responseData['error'] ?? 'Login failed';
      }
    } catch (e) {
      _error = 'Error connecting to server';
    }
    notifyListeners();
  }

  //Fetch User's profile
  Future<void> _fetchUserProfile() async {
    if(_token == null) return;

    try {
      final response = await http.get(
        Uri.parse('http://192.168.186.69:7000/api/v1/user/me'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token'
        }
      );

      if(response.statusCode == 200){
        final responseData = jsonDecode(response.body);
        _userName = responseData['firstName'] ?? 'Unknown user';
        _error = null;
      }else {
        _error = jsonDecode(response.body)['error'] ?? 'Failed to get user data';
        await logout();
      }

    } catch (e) {
      _error = 'Error connecting to server';
    }
    notifyListeners();
  }

  //Fetch the user's streak
  Future<void> _fetchStreak() async {
    if(_token == null) {
      print("No token stored, skip streak fectching");
      return;
    }

    try {
      print("Fectching streak with token $_token");

      final response = await http.get(
        Uri.parse('http://192.168.186.69:7000/api/v1/user/show-streak'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token'  
        },  
      );

      if(response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        _userStreak = responseData["data"]?["currentStreak"] ?? 0;
        _error = null;
        print('Streak updated : $_userStreak');
      }else {
        _error = jsonDecode(response.body)['error'] ?? "Failed to retrieve streak";
        if(response.statusCode == 401){
          print("Unauthorized logging out");
          await logout();
        }
      }
    } catch (e) {
      _error = "Error connecting to servers $e";
      print("Unable to connect to sever: $e");
    }
    notifyListeners();
  }


  Future<void> logout() async {
    await AuthStorage.deleteToken();
    _token = null;
    _isAuthenticated = false;
    _userName = null;
    _userStreak = null;
    _error = null;
    notifyListeners();
  }

}


