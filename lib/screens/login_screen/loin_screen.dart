import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tinder/screens/home_screen/custom_drawer.dart';
import 'package:tinder/screens/my_profile.dart/my_profile.dart';
import 'package:tinder/screens/register_screen/reg_user_name.dart';
import '../../utils/constatnt.dart';
import 'package:rive/rive.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              width: size.width * 1.7,
              bottom: 150,
              left: 120,
              child: Image.asset(
                Constants.imageAsset("Spline.png"),
                // scale: 2.5,
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 10),
                // child: SizedBox(),
              ),
            ),
            RiveAnimation.asset("assets/images/shapes.riv"),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: SizedBox(),
              ),
            ),
            Positioned(
              top: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome to",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.blue[800],
                          ),
                          children: [
                            TextSpan(
                              text: " Dating App",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900],
                              ),
                            )
                          ]),
                    ),
                    Text(
                      "Signin to Continue",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AnimationLimiter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Lottie.asset(
                            'assets/images/27715-login-anim.json',
                            width: 250,
                            // height: 200,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 30, left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: new Color.fromRGBO(255, 255, 255, 0.3),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                ]),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                customTextField(
                                    CupertinoIcons.envelope,
                                    "Username",
                                    "Username",
                                    false,
                                    false, (value) {
                                  if (value!.isEmpty) {
                                    return ("Please enter password");
                                  }
                                  return null;

                                  // return null;
                                }, true, true),
                                const SizedBox(
                                  height: 10,
                                ),
                                customTextField(CupertinoIcons.lock, "Password",
                                    "Password", false, false, (value) {
                                  if (value!.isEmpty) {
                                    return ("Please enter password");
                                  }
                                  return null;

                                  // return null;
                                }, true, true),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(0.0),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CustomDrawer(),
                                      ),
                                    );
                                  },
                                  child: Ink(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.purple,
                                      // gradient: const LinearGradient(
                                      //   colors: [
                                      //     Color.fromRGBO(123, 31, 162, 1),
                                      //     Color.fromRGBO(156, 39, 176, 1),
                                      //     // Colors.blue,
                                      //     // Colors.purple,
                                      //   ],
                                      // ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(18),
                                      child: const Text('Login',
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'or Login with Email',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    Constants.imageAsset("google.png"),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    Constants.imageAsset("facebook.png"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          Userregistername()),
                                    ),
                                  );
                                },
                                child: Text(
                                  " Signup",
                                  style: TextStyle(
                                      color: Colors.blue[900],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding customTextField(
    IconData icon,
    String hintText,
    String labelText,
    bool isPassword,
    bool isEmail,
    String? Function(String?)? validator,
    bool suffics,
    bool obscure,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   hintText,
          //   style: const TextStyle(fontSize: 13, color: Constants.labelText),
          // ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            // obscureText: obscure,
            obscureText: false,
            // controller: controller,
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 243, 245, 247),
              prefixIcon: Icon(
                icon,
                color: Constants.iconColor,
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.eye),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              labelText: hintText,
              hintStyle:
                  const TextStyle(fontSize: 14, color: Constants.textColor1),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
