import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Myprofile extends StatefulWidget {
  Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileScreenState();
}

class SliderItem extends StatelessWidget {
  const SliderItem({
    Key? key,
    required this.text1,
    required this.text2,
    required this.textbutton,
  }) : super(key: key);

  final String text1;
  final String text2;
  final String textbutton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 37),
        Text(
          text1,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text2,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            child: Text(textbutton),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

List<Widget> list = [
  const SliderItem(
    text1: 'See Who Likes You',
    text2: 'See Who Likes You and More!',
    textbutton: 'Get Premium',
  ),
  const SliderItem(
    text1: 'Upgrade Your Love Life',
    text2: 'Subscribe to Premium Plan',
    textbutton: 'See All Plans',
  ),
  const SliderItem(
    text1: 'Boost',
    text2: 'Be a Top Profile in Your Area',
    textbutton: 'My Boost',
  ),
];

class _MyprofileScreenState extends State<Myprofile> {
  int $i = 23;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(180, 60),
                      bottomLeft: Radius.elliptical(180, 60),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 63, 62, 62),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ]),
                child: Container(
                  width: double.infinity,
                  height: 350.0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Container(
                            child: Stack(
                              children: [
                                Container(
                                  child: CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 5.0,
                                    percent: 0.3,
                                    startAngle: 225,
                                    center: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        "https://www.trendrr.net/wp-content/uploads/2017/06/Deepika-Padukone-1.jpg",
                                      ),
                                      radius: 50.0,
                                    ),
                                    progressColor:
                                        Color.fromARGB(255, 218, 40, 93),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 88, left: 5),
                                    child: Container(
                                      margin: const EdgeInsets.all(10.0),
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          border: Border.all(
                                              color: Colors
                                                  .pink, // Set border color
                                              width: 3.0), // Set border width
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  10.0)), // Set rounded corner radius
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 10,
                                                color: Colors.black,
                                                offset: Offset(1, 3))
                                          ] // Make rounded corner of border
                                          ),
                                      child: Text(
                                        $i.toString() + '%' + ' COMPLETE',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: SizedBox(
                            height: 10.0,
                          ),
                        ),
                        Container(
                          child: Text(
                            "Natasha",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3.4,
                                height: MediaQuery.of(context).size.height / 6,
                                child: Column(children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white, // border color
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: new Column(
                                                children: <Widget>[
                                                  new Icon(
                                                    Icons.settings,
                                                    size: 25.0,
                                                  ),
                                                  new Text('SETTINGS',
                                                      style: TextStyle(
                                                          fontSize: 8)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: ((context) => Editprofile())));
                              },
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3.4,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    child: Column(children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, top: 20),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    10,
                                                decoration: BoxDecoration(
                                                  color: Colors
                                                      .white, // border color
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20),
                                                  child: new Column(
                                                    children: <Widget>[
                                                      new Icon(
                                                        Icons.edit,
                                                        size: 25.0,
                                                      ),
                                                      new Text('EDIT PROFILE',
                                                          style: TextStyle(
                                                              fontSize: 8)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: ((context) => Addmedia())));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.4,
                                  height:
                                      MediaQuery.of(context).size.height / 6,
                                  child: Column(children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  10,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(255, 194,
                                                    27, 69), // border color
                                                shape: BoxShape.circle,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: new Column(
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.camera_alt,
                                                      color: Colors.white,
                                                      size: 25.0,
                                                    ),
                                                    new Text('ADD VEDIO',
                                                        style: TextStyle(
                                                            fontSize: 8)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: list.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return SizedBox(
                          child: Column(
                            children: [i],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
