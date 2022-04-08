import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  AlignmentGeometry alignment = Alignment.center;
  double _height = 50.0;
  double _width = 50.0;
  Color _color = Colors.orange;
  Radius _topLeftRadius = const Radius.circular(0);
  Radius _topRightRadius = const Radius.circular(0);
  Radius _bottomLeftRadius = const Radius.circular(0);
  Radius _bottomRightRadius = const Radius.circular(0);

  final List<AlignmentGeometry> alignments = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  final List<Color> _colors = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text('AnimatedContainer'),
            subtitle: Text(
                'Versão animada do Container que muda gradualmente seus valores ao longo de um período de tempo.'),
          ),
          Container(
            height: 250,
            padding: const EdgeInsets.all(8),
            child: AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft:  _topLeftRadius,
                  topRight:  _topRightRadius,
                  bottomLeft:  _bottomLeftRadius,
                  bottomRight:  _bottomRightRadius,
                ),
                color: _color,
              ),
              height: _height,
              width: _width,
              alignment: alignment,
              duration: const Duration(milliseconds: 500),
              child: const FlutterLogo(
                size: 50,
              ),
              curve: Curves.fastOutSlowIn,
            ),
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: _changeAnimation,
                child: const Text('Animar'),
              )
            ],
          )
        ],
      ),
    );
  }

  void _changeAnimation() {
    setState(() {
      alignment = alignments[Random().nextInt(alignments.length - 1)];
      _color = _colors[Random().nextInt(_colors.length - 1)];
      _height = Random().nextDouble() * 500;
      _width = Random().nextDouble() * 500;
      _topLeftRadius = Radius.circular(Random().nextDouble() * 100);
      _topRightRadius = Radius.circular(Random().nextDouble() * 100);
      _bottomLeftRadius = Radius.circular(Random().nextDouble() * 100);
      _bottomRightRadius = Radius.circular(Random().nextDouble() * 100);
    });
  }
}
