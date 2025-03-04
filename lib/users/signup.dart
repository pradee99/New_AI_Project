import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:food/api_connection/api_connection.dart';

import '../config/theme.dart';
import '../widget/customButton.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _signup() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final response = await http.post(
        Uri.parse(API.signUp),
        body: {
          'user_name': _usernameController.text,
          'user_email': _emailController.text,
          'user_password': _passwordController.text,
        },
      );

      setState(() {
        _isLoading = false;
      });

      print("Response Body: ${response.body}");

      try {
        final data = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'])),
        );

        if (data['success']) {
          Navigator.pushNamed(context, '/login');
        }
      } catch (e) {
        print("JSON Parsing Error: $e"); // Debugging line
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error processing request")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up"),centerTitle: true,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Username Field
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: primaryDark,
                      ),
                      focusColor: primaryDark),
                  validator: (value) =>
                      value!.isEmpty ? "Enter a username" : null,
                ),
                const SizedBox(height: 16),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: primaryDark,
                      ),
                      focusColor: primaryDark),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      value!.isEmpty ? "Enter an email" : null,
                ),
                const SizedBox(height: 16),

                // Password Field
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: primaryDark,
                      ),
                      focusColor: primaryDark
                  ),
                  obscureText: true,
                  validator: (value) => value!.length < 6
                      ? "Password must be at least 6 characters"
                      : null,
                ),
                const SizedBox(height: 24),

                // Signup Button
                Custombutton(
                  text: 'Sign Up',
                  icon: Icons.edit,
                  onPressed: _signup,
                ),
                // Login Navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: primaryMain, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, "/login"),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: primaryMain,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
