import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class SignupProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  var formKey = GlobalKey<FormState>();
  final _logusername = TextEditingController();
  TextEditingController get userlogController => _logusername;

  final _logpassword = TextEditingController();
  TextEditingController get passlogController => _logpassword;
  // String _name;
  final _username = TextEditingController();
  TextEditingController get usernameController => _username;

  final _password = TextEditingController();
  TextEditingController get passwordController => _password;

  final _email = TextEditingController();
  TextEditingController get emailController => _email;

  final _wonfirmPassword = TextEditingController();
  TextEditingController get confirmPasswordController => _wonfirmPassword;

  Future<void> startSignUp() async {
    if (_password.text == _wonfirmPassword.text) {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
                email: _email.text, password: _password.text);
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
      }
    } else {}
  }

  Future<void> registeruser() async {
    var url = "https://est.satasme.uk/api/create";
    final response = await http.post(Uri.parse(url), body: {
      "username": _username.text,
      "email": _email.text,
      "password": _password.text,
    });
  }
}
