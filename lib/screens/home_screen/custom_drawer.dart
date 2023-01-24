import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            children: [
              InfoCard(
                name: "Chamil pathirana",
                proffesion: "Softeare developer",
              ),
              SideMenuTile()
            ],
          ),
        ),
      ),
    );
  }
}

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.white24,
        ),
        ListTile(
          leading: SizedBox(
            child: Icon(CupertinoIcons.home, color: Colors.white),
            height: 34,
            width: 34,
          ),
          title: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.name, required this.proffesion})
      : super(key: key);
  final String name, proffesion;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(CupertinoIcons.person, color: Colors.white),
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        proffesion,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
