import 'package:dio/dio.dart';
import 'package:prueba_tecnica_jmot/services/api_service.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class ImageRepository {
  Future<void> uploadImage(File image, String title, String description) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    FormData formData = FormData.fromMap({
      'title': title,
      'description': description,
      'image': await MultipartFile.fromFile(image.path, filename: 'upload.jpg'),
    });

    await ApiService.dio.post(
      '/images/upload',
      data: formData,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  Future<List<Map<String, String>>> fetchImages() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await ApiService.dio.get(
      '/images',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return List<Map<String, String>>.from(response.data);
  }
}