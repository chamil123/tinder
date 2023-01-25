import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder/provider/user_provider.dart';

import 'package:tinder/screens/register_screen/gender_screen.dart';
import 'package:tinder/screens/register_screen/reg_user_verification.dart';

class Userregisterphone extends StatefulWidget {
  Userregisterphone({super.key});

  @override
  State<Userregisterphone> createState() => _Userregisterphonestate();
}

class _Userregisterphonestate extends State<Userregisterphone> {
  late double height, width;
  String phoneno = "";

  final TextEditingController phonecontroller = TextEditingController();
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
                                  'Your Phone no is...',
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
                            padding: const EdgeInsets.only(top: 0),
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 22, fontFamily: 'Raleway'),
                              maxLength: 10,
                              controller: value.phonecontroller,
                              onChanged: (value) {
                                setState(() {
                                  phoneno = value;
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 25.0, horizontal: 10.0),
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Color.fromARGB(255, 243, 243, 243),
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
                            value.usermobilenoreg();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Userverification(),
                              ),
                            );
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
