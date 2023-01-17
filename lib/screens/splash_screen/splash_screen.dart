import 'package:flutter/material.dart';
import 'package:tinder/utils/constatnt.dart';

import '../login_screen/loin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromRGBO(217, 8, 63, 1),
              Color.fromRGBO(255, 67, 116, 1),
              // Colors.blue,
              // Colors.purple,
            ],
          ),
        ),
        child: Image.asset(
          Constants.imageAsset("11.png"),
          scale: 2.5,
        ),
      ),
    );
  }
}
