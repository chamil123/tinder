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
                          if (imageFile != null)
                            Container(
                              width: 440,
                              height: 400,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                    image: FileImage(imageFile!),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            )
                          else
                            Container(
                              width: 440,
                              height: 400,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                border:
                                    Border.all(width: 8, color: Colors.black12),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: const Text(
                                'Front side',
                                style: TextStyle(fontSize: 26),
                              ),
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () =>
                                        getImage(source: ImageSource.camera),
                                    child: const Text('Capture Image',
                                        style: TextStyle(fontSize: 18))),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () =>
                                        getImage(source: ImageSource.gallery),
                                    child: const Text('Select Image',
                                        style: TextStyle(fontSize: 18))),
                              )
                            ],
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

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(
        source: source,
        maxWidth: 640,
        maxHeight: 480,
        imageQuality: 70 //0 - 100
        );

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}
