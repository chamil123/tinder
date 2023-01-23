import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder/provider/user_provider.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:intl/intl.dart';
import 'package:tinder/screens/register_screen/reg_user_email.dart';

class Userregbirthday extends StatefulWidget {
  Userregbirthday({super.key});

  @override
  State<Userregbirthday> createState() => _Userregbirthdaystate();
}

class _Userregbirthdaystate extends State<Userregbirthday> {
  late double height, width;
  String name = "";
  String _index = "";
  String value = "";

  TextEditingController _controllerbday = new TextEditingController();
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
                                  'Your birthday is...',
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
                                  'You can only change birthday ONCE...',
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: TextFormField(
                              keyboardType: TextInputType.none,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                              controller: _controllerbday,
                              onTap: () async {
                                BottomPicker.date(
                                  title: 'Set your Birthday',
                                  dateOrder: DatePickerDateOrder.dmy,
                                  pickerTextStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  titleStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  onSubmit: (index) {
                                    print(index);
                                    var date = DateTime.parse("$index");

                                    String formattedDate =
                                        DateFormat.yMMMEd().format(date);
                                    print(formattedDate);
                                    _controllerbday.text =
                                        formattedDate.toString();
                                  },
                                  bottomPickerTheme:
                                      BottomPickerTheme.plumPlate,
                                ).show(context);
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
                            value.birthday();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Userregisteremail(),
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
