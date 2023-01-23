import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder/provider/user_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:tinder/screens/register_screen/gender_screen.dart';
import 'package:tinder/screens/register_screen/reg_user_mobile.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Userregisteremail extends StatefulWidget {
  Userregisteremail({super.key});

  @override
  State<Userregisteremail> createState() => _Userregisteremailstate();
}

class _Userregisteremailstate extends State<Userregisteremail> {
  late double height, width;
  String email = "";

  final TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        height = MediaQuery.of(context).size.height;
        width = MediaQuery.of(context).size.width;
        return Scaffold(
          body: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Your email is...',
                                  style: TextStyle(fontSize: 22),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'This is how you will appear on this..',
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: TextFormField(
                              controller: value.emailcontroller,
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 235, 235, 235),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 20, right: 20),
                      child: Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          onPressed: () {
                            value.useremailreg();

                            final bool isValid = EmailValidator.validate(email);
                            print(isValid.toString());
                            if (isValid == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Userregisterphone(),
                                ),
                              );
                            } else {
                              Fluttertoast.showToast(msg: 'Enter Valid email!');
                            }
                          },
                          color: Color.fromARGB(255, 221, 19, 96),
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Raleway',
                              fontSize: 22.0,
                            ),
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
      },
    );
  }
}
