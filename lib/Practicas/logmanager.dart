// login_manager.dart
import 'package:flutter/material.dart';
import 'package:seridorflutter/Pages/Home.dart';
import 'loginservice.dart';

class LoginManager {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(bool) setLoading;
  final BuildContext context;

  LoginManager({
    required this.emailController,
    required this.passwordController,
    required this.setLoading,
    required this.context,
  });

  Future<void> login() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both email and password')),
      );
      return;
    }

    setLoading(true);

    bool loginSuccess = await loginService(email, password);

    setLoading(false);

    if (loginSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login successful'),
          duration: Duration(seconds: 2), // Duración del SnackBar
        ),
      );

      // Esperar a que el SnackBar desaparezca antes de navegar
      await Future.delayed(Duration(seconds: 2));

      // Navegar a la página de inicio
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
    }
  }
}
