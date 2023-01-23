import 'package:flutter/material.dart';
import 'package:tinder/Model/user_model.dart';

import 'package:provider/provider.dart';
import 'package:tinder/provider/user_provider.dart';
import 'package:tinder/screens/register_screen/birthday_screen.dart';

class Genderchange extends StatefulWidget {
  Genderchange({super.key});

  @override
  State<Genderchange> createState() => _Genderchangestate();
}

class _Genderchangestate extends State<Genderchange> {
  bool isFemale = true;
  bool isMale = false;
  double malevalue = 0;
  double femalevalue = 0;
  String gendermale = "male";
  String genderfemale = "female";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // UserModel userModel =
    //     Provider.of<UserProvider>(context, listen: false).getUserModel!;
    // print(">>>>>>>>>>>>>>>>>>>>>> : " + userModel.username);
  }

  late double height, width;
  int _value = 0;

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
                    height: MediaQuery.of(context).size.height / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'You are...',
                                  style: TextStyle(fontSize: 22),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 180,
                              child: Row(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          child: Column(
                                            children: [
                                              GestureDetector(
                                                onTap: (() {
                                                  setState(() {
                                                    isFemale = false;
                                                    isMale = true;
                                                    UserProvider()
                                                        .gendermale(gendermale);
                                                  });
                                                }),
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      if (isMale == true) ...[
                                                        male()
                                                      ] else ...[
                                                        maleblack()
                                                      ],
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          child: Column(
                                            children: [
                                              GestureDetector(
                                                onTap: (() {
                                                  setState(() {
                                                    isFemale = true;
                                                    isMale = false;
                                                    UserProvider().genderfemale(
                                                        genderfemale);
                                                  });
                                                }),
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      if (isFemale == true) ...[
                                                        female(),
                                                      ] else ...[
                                                        femaleblack()
                                                      ],
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Userregbirthday(),
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

  Image female() {
    return Image.asset(
      "assets/images/female.png",
      // width: 200,
      // height: 100,
      fit: BoxFit.fill,
      scale: 3,
    );
  }

  Image femaleblack() {
    return Image.asset(
      "assets/images/femaleblack.png",
      // width: 200,
      // height: 100,
      fit: BoxFit.fill,
      scale: 3,
    );
  }

  Image male() {
    return Image.asset(
      "assets/images/male.png",
      // width: 200,
      // height: 100,
      fit: BoxFit.fill,
      scale: 3,
    );
  }

  Image maleblack() {
    return Image.asset(
      "assets/images/maleblack.png",
      // width: 200,
      // height: 100,
      fit: BoxFit.fill,
      scale: 3,
    );
  }

  Container femalecontainer() {
    return Container(
      child: Image.asset(
        "assets/images/female.png",
        // width: 200,
        // height: 100,
        fit: BoxFit.fill,
        scale: 3,
      ),
    );
  }

  Container femaleuncontainer() {
    return Container(
      child: Image.asset(
        "assets/images/femaleblack.png",
        // width: 200,
        // height: 100,
        fit: BoxFit.fill,
        scale: 3,
      ),
    );
  }
}
