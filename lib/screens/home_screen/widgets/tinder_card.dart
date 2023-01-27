import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tinder/provider/tinder_card_provider.dart';
import 'package:provider/provider.dart';
import '../../../Model/user.dart';
import "dart:math" show pi;

class TinderCard extends StatefulWidget {
  final String urlImage;
  final bool isFront;
  const TinderCard({
    Key? key,
    required this.urlImage,
    required this.isFront,
  }) : super(key: key);

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<TinderCardProvider>(context, listen: false)
          .setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: widget.isFront ? buildFrontCard(size) : buildCard(size),
    );
  }

  Consumer<TinderCardProvider> buildFrontCard(Size size) {
    return Consumer<TinderCardProvider>(
      builder: (context, value, child) {
        return GestureDetector(
          child: LayoutBuilder(builder: (context, constraints) {
            final position = value.position;
            final milliseconds = value.isDragging ? 0 : 400;
            final angle = value.angle * pi / 180;
            final center = constraints.smallest.center(Offset.zero);
            final rotateMatrix = Matrix4.identity()
              ..translate(center.dx, center.dy)
              ..rotateZ(angle)
              ..translate(-center.dx, -center.dy);

            return AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: milliseconds),
                transform: rotateMatrix..translate(position.dx, position.dy),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.urlImage),
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
                ));
          }),
          onPanStart: (details) {
            value.stastPosition(details);
          },
          onPanUpdate: (details) {
            value.updatePosition(details);
          },
          onPanEnd: (details) {
            value.endPosition();
          },
        );
      },
    );
  }

  Widget buildName() => Row(
        children: [
          Text(
            "Chamil",
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
            '${"25"}',
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

  buildCard(Size size) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.urlImage),
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
}
