import 'package:flutter/material.dart';

class AnimatedScaleWidget extends StatefulWidget {
  const AnimatedScaleWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedScaleWidget> createState() => _AnimatedScaleWidgetState();
}

class _AnimatedScaleWidgetState extends State<AnimatedScaleWidget> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text('AnimatedScale'),
            subtitle: Text(
              'Versão animada de Transform.scale que faz a transição automática da escala do child em uma determinada duração sempre que a escala especificada for alterada.',
            ),
          ),
          Container(
            height: 250,
            padding: const EdgeInsets.all(8),
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 750),
              child: const FlutterLogo(),
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
      setState(() => _scale = _scale == 1.0 ? 7.0 : 1.0);
  }
}
