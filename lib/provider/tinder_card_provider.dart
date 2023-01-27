import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../Model/user_model.dart';

enum CardStatus { like, dislike, superLike }

class TinderCardProvider extends ChangeNotifier {
  List<String> _urlImages = [];

  bool _isDragging = false;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;
  double _angle = 0.0;

  List<String> get urlImages => _urlImages;
  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;

  TinderCardProvider() {
    resetUsers();
  }
  void stastPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;
    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;
    notifyListeners();
  }

  void endPosition() {
    _isDragging = false;
    notifyListeners();

    final status = getStatus();

    if (status != null) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: status.toString().split(".").last.toUpperCase(), fontSize: 36);
    }
    switch (status) {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        like();
        break;
      case CardStatus.superLike:
        like();
        break;
      default:
        resetPosition();
    }
  }

  void like() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);
    _nextCard();
    notifyListeners();
  }

  Future _nextCard() async {
    if (_urlImages.isEmpty) return;
    await Future.delayed(Duration(milliseconds: 200));
    _urlImages.removeLast();
    resetPosition();
  }

  CardStatus? getStatus() {
    final x = _position.dx;
    final delta = 100;
    if (x >= delta) {
      return CardStatus.like;
    }
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;
    notifyListeners();
  }

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void resetUsers() {
    _urlImages = <String>[
      'https://i.pinimg.com/originals/02/fc/93/02fc93a2bfc6c1cac3db1a678f1837b0.jpg',
      'https://i.pinimg.com/originals/00/1e/ea/001eea4de1bcd8124ed7823c951525b1.jpg',
      'https://i.pinimg.com/originals/1e/5b/04/1e5b0443df9418df5e06bcdf52f99654.jpg',
      'https://i.pinimg.com/originals/f5/21/5c/f5215c4e29a1f95354e6f05967219830.jpg',
      'https://i.pinimg.com/originals/2a/cb/39/2acb39a127e5e848b43c002768d36f9b.jpg',
      'https://i.pinimg.com/originals/17/91/ca/1791ca707e77972180198ad1ae3dcdb0.jpg',
    ].reversed.toList();
    notifyListeners();
  }
}
