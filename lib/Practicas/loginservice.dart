// login_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> loginService(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://localhost:8080/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  return response.statusCode == 200;
}
