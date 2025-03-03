import 'package:dio/dio.dart';
import 'package:prueba_tecnica_jmot/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future<String> login(String email, String password) async {
    final response = await ApiService.dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });

    final token = response.data['token'];
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    return token;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}