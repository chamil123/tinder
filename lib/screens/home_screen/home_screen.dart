import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinder/provider/tinder_card_provider.dart';
import '../../Model/user.dart';
import 'widgets/tinder_card.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  final user = User(
    name: "Chamil",
    age: 20,
    urlImage:
        "https://i.pinimg.com/originals/c8/3f/9c/c83f9cc1b3e63e57409f027a218c9c4d.jpg",
    // "https://i.pinimg.com/originals/02/fc/93/02fc93a2bfc6c1cac3db1a678f1837b0.jpg",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(26, 41, 41, 41),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        selectedColorOpacity: 0.25,
        unselectedItemColor: Color.fromARGB(255, 138, 138, 138),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(CupertinoIcons.heart),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(CupertinoIcons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
      body: buildCards(),
    );
  }
}

class buildCards extends StatelessWidget {
  const buildCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TinderCardProvider>(builder: (context, value, child) {
      final urlImages = value.urlImages;
      return Stack(children: [
        ...urlImages
            .map(
              (urlImage) => TinderCard(
                urlImage: urlImage,
                isFront: urlImages.last == urlImage,
              ),
            )
            .toList(),
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
        Positioned(
          bottom: 80,
          right: 10,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.clear,
                  color: Colors.red,
                  size: 20,
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  primary: Colors.white.withOpacity(0.2),
                  shape: const CircleBorder(
                    side: BorderSide(color: Colors.white),
                  ),
                  padding: EdgeInsets.all(18),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "25",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.5, 0.5),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 8.0,
                      color: Color.fromARGB(125, 0, 0, 255),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.star,
                  color: Colors.blue,
                  size: 20,
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  primary: Colors.white.withOpacity(0.2),
                  shape: const CircleBorder(
                    side: BorderSide(color: Colors.white),
                  ),
                  padding: EdgeInsets.all(18),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "25",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.5, 0.5),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 8.0,
                      color: Color.fromARGB(125, 0, 0, 255),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.favorite,
                  color: Colors.teal,
                  size: 20,
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  primary: Colors.white.withOpacity(0.2),
                  shape: const CircleBorder(
                    side: BorderSide(color: Colors.white),
                  ),
                  padding: EdgeInsets.all(18),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "650",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.5, 0.5),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 8.0,
                      color: Color.fromARGB(125, 0, 0, 255),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]);
    });
  }
}
