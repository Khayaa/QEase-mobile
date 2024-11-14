import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String apiUrl = 'https://q-ease.khaya.dev/api';
  //Login
  Future<Map<String, dynamic>> login(
      String email, String password, String deviceName) async {
    final response = await http.post(
      Uri.parse('$apiUrl/auth/login'),
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer ${await getUserToken()}',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
        'device_name': deviceName,
      }),
    );

    print("${response.body}  | ${response.statusCode}");

    final Map<String, dynamic> result = _handleResponse(response);

    if (result['success']) {
      final Map<String, dynamic> userData = result['user'];
      final int userId = userData['id'];
      final String userName = userData['name'];
      final String userEmail = userData['email'];

      // Save the user ID & token when logging in
      await saveUserData(userId, userName, userEmail);
      await saveUserToken(result['token']);
    }

    return _handleResponse(response);
  }

// Clear User Data
  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId'); // Remove user ID
    await prefs.remove('userToken'); // Remove token
    await prefs.remove('userName');
    await prefs.remove('userEmail');

    // Remove Name
  }

  //logout User
  Future<void> logout() async {
    try {
      final userId = await getUserId(); // Get the user ID
      if (userId != null) {
        final response = await http.post(
          Uri.parse('https://q-ease.khaya.dev/api/auth/logout'),
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
            'Authorization': 'Bearer ${await getUserToken()}',
          },
          body: jsonEncode({'id': userId}),
        );

        if (response.statusCode == 204) {
          await clearUserData(); // Clear user data from storage
        } else {
          // Handle errors or display a message to the user
          throw Exception('Failed to log out');
        }
      }
    } catch (e) {
      // Handle network or other exceptions
      throw Exception('Failed to log out: $e');
    }
  }

  // Register User
  Future<Map<String, dynamic>> register(
      {required String name,
      required String email,
      required String password,
      required String passwordConfirmation,
      required String deviceName,
      required String roleId}) async {
    final response = await http.post(
      Uri.parse('$apiUrl/auth/register'),
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json'
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'device_name': deviceName,
        'role_id': roleId
      }),
    );

    final Map<String, dynamic> result = _handleResponse(response);

    if (result['success']) {
      final Map<String, dynamic> userData = result['user'];
      final int userId = userData['id'];
      final String userName = userData['name'];
      final String userEmail = userData['email'];
      final int roleId = userData['role_id'];
      // Save the user ID & token when logging in
      await saveUserData(userId, userName, userEmail);
      await saveUserToken(result['token']);
    }

    return result;
  }

  //Forgot Password

  Future<Map<String, dynamic>> sendResetLinkEmail({
    required String email,
  }) async {
    final response = await http.post(
      Uri.parse('$apiUrl/password/email'),
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json'
      },
      body: jsonEncode({
        'email': email,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return {
        'success': true,
        'message': responseData['message'],
      };
    } else {
      //
      final Map<String, dynamic> errorData = jsonDecode(response.body);
      return {'success': false, 'error': errorData['message']};
    }
  }

  //Verify Pin
  Future<Map<String, dynamic>> verifyPin({
    required String email,
    required String pin,
  }) async {
    final response = await http.post(
      Uri.parse('$apiUrl/password/verify'),
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json'
      },
      body: jsonEncode({
        'email': email,
        'pin': pin,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return {
        'success': true,
        'message': responseData['message'],
      };
    } else {
      //
      final Map<String, dynamic> errorData = jsonDecode(response.body);
      return {'success': false, 'error': errorData['message']};
    }
  }

  //Reset Password
  Future<Map<String, dynamic>> resetPassword({
    required String pin,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await http.post(
      Uri.parse('$apiUrl/password/reset'),
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json'
      },
      body: jsonEncode({
        'pin': pin,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return {
        'success': true,
        'message': responseData['message'],
      };
    } else {
      //
      final Map<String, dynamic> errorData = jsonDecode(response.body);
      return {'success': false, 'error': errorData['message']};
    }
  }

  //save User Data
  Future<void> saveUserData(
      int userId, String userName, String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', userId);
    prefs.setString('userName', userName);
    prefs.setString('userEmail', userEmail);
  }

//Get User Id
  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }

//Get UserName
  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName');
  }

//Save User Token
  Future<void> saveUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userToken', token);
  }

//Get User Token
  Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken');
  }

  //Check if User is Logged In
  Future<bool> isLoggedIn() async {
    final token = await getUserToken();
    return token != null;
  }

  //Login - Register Response
  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Successful login or registration
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      return {
        'success': true,
        'token': responseData['token'],
        'user': responseData['user'],
        'role_id': responseData['role_id'],
        'message': responseData['message'],
      };
    } else {
      // Login or registration failed
      final Map<String, dynamic> errorData = jsonDecode(response.body);
      return {'success': false, 'error': errorData['message']};
    }
  }

  // Send Fcm Token to Server
  Future<void> sendTokenToServer(String? token) async {
    final userId = await getUserId(); // Get the user ID
    if (userId != null) {
      final response = await http.post(
        Uri.parse('$apiUrl/save-token'),
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer ${await getUserToken()}',
        },
        body: jsonEncode({
          'user_id': userId,
          'token': token,
        }),
      );

      if (response.statusCode == 200) {
        print('FCM token sent to server');
        print(" Response Body: ${response.body}");
      } else {
        // Handle errors or display a message to the user
        throw Exception('Failed to send FCM token to server');
      }
    }
  }

  // Store fcm Token
  Future<void> storeFcmToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('fcmToken', token);
  }

  // Get fcm Token
  Future<String?> getFcmToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('fcmToken');
  }
}
