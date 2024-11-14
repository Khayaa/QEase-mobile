import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:q_ease/models/queue_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QueueService {
  final String apiUrl = 'https://q-ease.khaya.dev/api';

  // Get User Token
 

  Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken');
  }

  // Get all queues
  Future<List<Queue>> getAllQueues() async {
    final response = await http.get(
      Uri.parse('$apiUrl/queues'),
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        // 'Authorization': 'Bearer ${await getUserToken()}',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Queue.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load queues');
    }
  }

  // Join a queue
  Future<Map<String, dynamic>> joinQueue(int queueId) async {
    final response = await http.post(
      Uri.parse('$apiUrl/queues/join'),
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer ${await getUserToken()}',
      },
      body: jsonEncode({'queue_id': queueId}),
    );

    return _handleResponse(response);
  }

  // Leave a queue
  Future<Map<String, dynamic>> leaveQueue(int queueId) async {
    final response = await http.post(
      Uri.parse('$apiUrl/queues/leave'),
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer ${await getUserToken()}',
      },
      body: jsonEncode({'queue_id': queueId}),
    );

    return _handleResponse(response);
  }

  // Get queue status
  Future<Map<String, dynamic>> getQueueStatus(int queueId) async {
    final response = await http.get(
      Uri.parse('$apiUrl/queues/$queueId/status'),
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer ${await getUserToken()}',
      },
    );

    return _handleResponse(response);
  }

  // Handle API response
  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return {
        'success': true,
        'data': responseData,
      };
    } else {
      final Map<String, dynamic> errorData = jsonDecode(response.body);
      return {'success': false, 'error': errorData['message']};
    }
  }
}