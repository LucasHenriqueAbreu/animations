import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  AlignmentGeometry _alignment = Alignment.center;

  final List<AlignmentGeometry> _alignments = [
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

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text('AnimatedAlign'),
            subtitle: Text('Versão animada de Align que muda automaticamente a posição da child em uma determinada duração sempre que o alinhamento especificado é alterado.'),
          ),
          Container(
            height: 250,
            padding: const EdgeInsets.all(8),
            child: AnimatedAlign(
              alignment: _alignment,
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
      _alignment = _alignments[Random().nextInt(_alignments.length - 1)];
    });
  }
}
