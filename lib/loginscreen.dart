import 'package:crudoperation/service/authservice.dart';
import 'package:crudoperation/signupscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'AuthWrapper.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
AuthService _auth = AuthService();


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Login')),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              User? user = await _auth.signIn(_emailController.text, _passwordController.text);

              if (user != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Login Successfully')),
                );              } else {
                // Show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Login failed')),
                );
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignupScreen()),
              );
            },
            child: const Text('Don\'t have an account? Sign Up'),
          ),
          TextButton(
            onPressed: () {
              // Implement forgot password flow
              // _authService.resetPassword(_emailController.text);
            },
            child: const Text('Forgot Password?'),
          ),
        ],
      ),
    ),
  );
}

}