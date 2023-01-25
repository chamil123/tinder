import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../Model/user.dart';

class TinderCard extends StatefulWidget {
  final User user;
  const TinderCard({Key? key, required this.user}) : super(key: key);

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.user.urlImage),
          fit: BoxFit.cover,
          alignment: Alignment(-0.3, 0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.7, 1],
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Spacer(),
              buildName(),
              profileName(),
              const SizedBox(
                height: 8,
              ),
              buildStatus(),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              // detailsScreen(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName() => Row(
        children: [
          Text(
            widget.user.name,
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '${widget.user.age}',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ],
      );
  Widget buildStatus() => Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            width: 10,
            height: 10,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "Recently Avtive",
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      );
  Widget profileName() => Row(
        children: [
          Text(
            "@Jsmine",
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      );
  Widget detailsScreen() => Row(
        children: [
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      );
}
