import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder/provider/user_provider.dart';

import 'package:tinder/screens/register_screen/gender_screen.dart';

class Userregistername extends StatefulWidget {
  Userregistername({super.key});

  @override
  State<Userregistername> createState() => _Userregisternamestate();
}

class _Userregisternamestate extends State<Userregistername> {
  late double height, width;
  String name = "";

  final TextEditingController usernamecontroller = TextEditingController();
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
                                  'Your name is...',
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
                              controller: value.usernamecontroller,
                              onChanged: (value) {
                                setState(() {
                                  name = value;
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
                            value.usernamereg();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Genderchange(),
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
