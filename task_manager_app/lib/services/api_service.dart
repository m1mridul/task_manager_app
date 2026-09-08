import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

class ApiService {
  static const String baseUrl = 'https://task.m348.com/api/v1'; // Update with target base URL

  Future<List<TaskModel>> getTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/listTask'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> taskList = data['data'] ?? [];
      return taskList.map((e) => TaskModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load tasks (${response.statusCode})');
    }
  }

  Future<bool> createTask(String title, String description) async {
    final response = await http.post(
      Uri.parse('$baseUrl/createTask'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'description': description,
        'status': 'Pending',
      }),
    );
    return response.statusCode == 200 || response.statusCode == 201;
  }

  Future<bool> updateTaskStatus(String id, String newStatus) async {
    final response = await http.get(
      Uri.parse('$baseUrl/updateTaskStatus/$id/$newStatus'),
    );
    return response.statusCode == 200;
  }

  Future<bool> deleteTask(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/deleteTask/$id'),
    );
    return response.statusCode == 200;
  }
}