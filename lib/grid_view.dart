// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({super.key});

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  final iconList = <Widget>[
    Image(image: AssetImage('truecaller.png')),
    Image(image: AssetImage('camera.png')),
    Image(image: AssetImage('linkedin.png')),
    Image(image: AssetImage('settings.png')),
    Image(image: AssetImage('instagram.png')),
    Image(image: AssetImage('facebook.png')),
    Image(image: AssetImage('youtube.png')),
    Image(image: AssetImage('game.png')),
    Image(image: AssetImage('pubg.png')),
    Image(image: AssetImage('freefire.png')),
    Image(image: AssetImage('whatsapp.png')),
    Image(image: AssetImage('cricket.png')),
  ];

  final itemList = List<int>.generate(12, (index) => index);
  bool animate = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  Future startAnimation() async {
    await Future.delayed(new Duration(seconds: 2));
    setState(() {
      animate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GridView",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 4,
          children: List.generate(
            12,
            (index) => Center(
              child: Card(
                color: Colors.amber,
                child: Stack(children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 1000),
                    bottom: animate ? 0 : 100,
                    child: IconButton(
                        onPressed: () {},
                        iconSize: 100,
                        icon: iconList[itemList[index]]),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
