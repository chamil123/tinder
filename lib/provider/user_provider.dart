import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../Model/user_model.dart';

class UserProvider extends ChangeNotifier {
  final _username = TextEditingController();
  TextEditingController get usernamecontroller => _username;

  final _bday = TextEditingController();
  TextEditingController get _controllerbday => _bday;

  final _email = TextEditingController();
  TextEditingController get emailcontroller => _email;

  final _phone = TextEditingController();
  TextEditingController get phonecontroller => _phone;

  // UserModel _userModel = new UserModel("", "", "");
  // UserModel get getUserModel => _userModel;

  Future<void> usernamereg() async {
    print(_username.text.toString());
  }

  Future<void> genderfemale(String genderfemale) async {
    print(genderfemale.toString());
  }

  Future<void> gendermale(String gendermale) async {
    print(gendermale.toString());
  }

  Future<void> birthday() async {
    print(_bday.text.toString());
  }

  Future<void> useremailreg() async {
    // String _emailtext = "";
    // _emailtext = _email.text;
    // final bool isValid = EmailValidator.validate(_emailtext);
    // print('Email is valid? ' + (isValid ? 'yes' : 'no'));

    print(_email.text.toString());
  }

  Future<void> usermobilenoreg() async {
    print(_phone.text.toString());
  }
}
