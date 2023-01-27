import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
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
  String _male = "";
  String _female = "";

  // UserModel _userModel = new UserModel("", "", "");
  // UserModel get getUserModel => _userModel;

  genderfemale(bool female) {
    if (female) {
      _female = "Male";
    }
    print("___________ : " + _female);
    notifyListeners();
  }

  gendermale(bool male) {
    if (male) {
      _male = "Male";
    }

    print(")))) : " + _male);

    notifyListeners();
  }

  Future<void> usernamereg() async {
    print(_username.text.toString());
  }

  Future<void> birthday() async {
    print(_bday.text.toString());
  }

  Future<void> useremailreg() async {
    print(_email.text.toString());
  }

  Future<void> usermobilenoreg() async {
    print(_phone.text.toString());
  }

  Future<void> registeruser() async {
    var url = "https://est.satasme.uk/api/create";
    final response = await http.post(Uri.parse(url), body: {
      "name": _username.text,
      "gendermale": _male,
      "genderfemale": _female,
      "bday": _bday.text,
      "email": _email.text,
      "phone": _phone.text,
      "frontvimg": "ddddddddd",
      "backbimg": "backkkkkk",
    });
    print(_username.text.toString());
    print(gendermale.toString());
    print(genderfemale.toString());
    print(_bday.text);
    print(_email.text.toString());
    print(_phone.text.toString());
  }
}
