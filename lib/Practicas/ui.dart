// login_screen.dart
import 'package:flutter/material.dart';
import 'logmanager.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  late LoginManager _loginManager;

  @override
  void initState() {
    super.initState();
    _loginManager = LoginManager(
      emailController: _emailController,
      passwordController: _passwordController,
      setLoading: (bool isLoading) {
        setState(() {
          _isLoading = isLoading;
        });
      },
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _loginManager.login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
