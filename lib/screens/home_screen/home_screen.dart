import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Model/user.dart';
import 'widgets/tinder_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = User(
    name: "Chamil",
    age: 20,
    urlImage: "https://picsum.photos/id/870/200/300?grayscale&blur=2",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //  Container(
          //   height: 40,
          //   width: 40,
          //   decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
          //     BoxShadow(
          //       color: Colors.black12,
          //       offset: Offset(0, 3),
          //       blurRadius: 8,
          //     ),
          //   ]),
          //   child: Icon(CupertinoIcons.text_justifyleft),
          // ),
          Container(
        padding: EdgeInsets.all(0),
        child: Stack(
          children: [
            TinderCard(user: user),
            Positioned(
              top: 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 3),
                          blurRadius: 8,
                        ),
                      ]),
                  child: Icon(Icons.sort),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
