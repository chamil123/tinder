import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder/provider/user_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tinder/screens/register_screen/gender_screen.dart';

class Userverification extends StatefulWidget {
  Userverification({super.key});

  @override
  State<Userverification> createState() => _Userverificationstate();
}

class _Userverificationstate extends State<Userverification> {
  late double height, width;
  File? imageFile;
  File? imageFilecam;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        height = MediaQuery.of(context).size.height;
        width = MediaQuery.of(context).size.width;
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.2,
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
                                'Verification..',
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
                                'NIC/Driving License/Passport',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: new SingleChildScrollView(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 20,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Front',
                                          style: TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 3.5,
                                  child: Column(
                                    children: [
                                      if (imageFilecam != null)
                                        Container(
                                          width: 440,
                                          height: 180,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 228, 225, 225),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: Container(
                                                      width: 30,
                                                      height: 20,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            print('object');
                                                            setState(() {
                                                              imageFilecam =
                                                                  null;
                                                            });
                                                          },
                                                          icon: Icon(Icons
                                                              .remove_outlined))),
                                                ),
                                              ),
                                              Container(
                                                width: 240,
                                                height: 140,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 228, 225, 225),
                                                  image: DecorationImage(
                                                      image: FileImage(
                                                          imageFilecam!),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      else
                                        Container(
                                          width: 440,
                                          height: 180,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 228, 225, 225),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FloatingActionButton(
                                                onPressed: () {
                                                  // Add your onPressed code here!
                                                  _showChoiceDialognew(context);
                                                },
                                                backgroundColor: Colors.pink,
                                                child: const Icon(
                                                    Icons.upload_file_rounded),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 20,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Back',
                                          style: TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 3.5,
                                  child: Column(
                                    children: [
                                      if (imageFile != null)
                                        Container(
                                          width: 440,
                                          height: 180,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 228, 225, 225),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: Container(
                                                      width: 30,
                                                      height: 20,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            print('object');
                                                            setState(() {
                                                              imageFile = null;
                                                            });
                                                          },
                                                          icon: Icon(Icons
                                                              .remove_outlined))),
                                                ),
                                              ),
                                              Container(
                                                width: 240,
                                                height: 140,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 228, 225, 225),
                                                  image: DecorationImage(
                                                      image:
                                                          FileImage(imageFile!),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      else
                                        Container(
                                          width: 440,
                                          height: 180,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 228, 225, 225),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FloatingActionButton(
                                                onPressed: () {
                                                  // Add your onPressed code here!
                                                  _showChoiceDialog(context);
                                                },
                                                backgroundColor: Colors.pink,
                                                child: const Icon(
                                                    Icons.upload_file_rounded),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          value.registeruser();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Genderchange(),
                          //   ),
                          // );
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
        );
      },
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(
        source: source,
        maxWidth: 340,
        maxHeight: 480,
        imageQuality: 70 //0 - 100
        );

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
    Navigator.pop(context);
  }

  void getnewImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(
        source: source,
        maxWidth: 340,
        maxHeight: 480,
        imageQuality: 70 //0 - 100
        );

    if (file?.path != null) {
      setState(() {
        imageFilecam = File(file!.path);
      });
    }
    Navigator.pop(context);
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () => getImage(source: ImageSource.gallery),
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () => getImage(source: ImageSource.camera),
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _showChoiceDialognew(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () => getnewImage(source: ImageSource.gallery),
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () => getnewImage(source: ImageSource.camera),
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
