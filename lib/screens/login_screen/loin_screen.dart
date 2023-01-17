import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../utils/constatnt.dart';

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
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
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
                  Image.asset(
                    Constants.imageAsset("color_logo.png"),
                    scale: 2.5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "T  I  N  D  E  R Test",
                    // style: GoogleFonts.popins(),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  customTextField(Icons.email_outlined, "Username", "Username",
                      false, false, (value) {
                    if (value!.isEmpty) {
                      return ("Please enter password");
                    }
                    return null;

                    // return null;
                  }, true, true),
                  const SizedBox(
                    height: 10,
                  ),
                  customTextField(
                      Icons.key_outlined, "Password", "Password", false, false,
                      (value) {
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
                    onPressed: () {},
                    child: Ink(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        // color: Colors.black,
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(217, 8, 63, 1),
                            Color.fromRGBO(255, 67, 116, 1),
                            // Colors.blue,
                            // Colors.purple,
                          ],
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        child: const Text('Login', textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                icon: Icon(Icons.visibility),
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
