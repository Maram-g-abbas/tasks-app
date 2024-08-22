import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tasks/app/core/utils/config.dart';

import '../models/auth.dart';
import '../models/user.dart';
class AuthService {
   static const String baseUrl = Config.baseUrl;
   static final userData= GetStorage();

  static Future<bool> login(Auth auth) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: authToJson(auth),
      headers: {'Content-Type': 'application/json',
      'Accept' : 'application/json'},
    );
    if(response.statusCode==200){
      var info = jsonDecode(response.body);
      userData.write("isLogged", true);
      String token = info['token'];
      String role= info['role'];
      userData.write("token", token);
      userData.write("role", role);
      return true;
    }
      return false;
  }

  static Future<Map<String, dynamic>> register(
      String name, String email, String password, password_confirmation) async {
          final response = await http.post(
            Uri.parse('$baseUrl/regester'),
            body: jsonEncode({'email': email, 'password': password, 'name': name,'password_confirmation': password_confirmation}),
            headers: {'Content-Type': 'application/json',
              'Accept' : 'application/json'},
          );

            final data = jsonDecode(response.body);
            return data; // Assuming the response contains a token and user information

  }

  static Future<void> logout() async {
    final response = await http.post(
      Uri.parse('$baseUrl/logout'),
      headers: {'Content-Type': 'application/json',
        'Accept' : 'application/json',
        'Authorization': "Bearer ${userData.read("token")}"},
    );

    final data = jsonDecode(response.body);
    print(data.toString()); // Assuming the response contains a token and user information

  }

  static Future<Map<String, dynamic>> getUserProfile() async {
    final response = await http.get(
      Uri.parse('$baseUrl/profile'),
      headers: {'Content-Type': 'application/json',
        'Accept' : 'application/json',
        'Authorization': "Bearer ${userData.read("token")}"},
    );

    final data = jsonDecode(response.body);
    return data; // Assuming the response contains a token and user information

  }
}