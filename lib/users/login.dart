import 'package:flutter/material.dart';
import 'package:food/config/theme.dart';
import 'package:food/layouts/authLayout.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:food/api_connection/api_connection.dart';
import 'package:food/screen/home.dart';

import '../widget/customButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final response = await http.post(
        Uri.parse(API.login), // Using API constant for login endpoint
        body: {
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
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AuthLayout()),
          );
        }
      } catch (e) {
        print("JSON Parsing Error: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error processing request")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      body: Container(
        
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 80),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Email Field
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: Image.asset(
                    'assets/images/logo1.png',
                    width: 180,
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    prefixIcon: Icon(
                      Icons.email,
                      color: primaryDark,
                    ),
                    focusColor: primaryDark,
                  ),
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
                      focusColor: primaryDark),
                  obscureText: true,
                  validator: (value) => value!.length < 6
                      ? "Password must be at least 6 characters"
                      : null,
                ),
                const SizedBox(height: 24),

                // Login Button
                Custombutton(
                  text: 'Sign In',
                  icon: Icons.login,
                  onPressed: _login, // Call the login function when the button is pressed
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: primaryMain, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, "/signup"),
                      child: const Text(
                        "Sign Up",
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
