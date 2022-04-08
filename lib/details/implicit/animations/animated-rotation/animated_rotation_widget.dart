import 'package:flutter/material.dart';

class AnimatedRotationWidget extends StatefulWidget {
  const AnimatedRotationWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedRotationWidget> createState() => _AnimatedRotationWidgetState();
}

class _AnimatedRotationWidgetState extends State<AnimatedRotationWidget> {
  double _turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text('AnimatedRotation'),
            subtitle: Text(
              'Versão animada de Transform.rotate que faz a transição automática da rotação do child em uma determinada duração sempre que a rotação especificada for alterada.',
            ),
          ),
          Container(
            height: 250,
            padding: const EdgeInsets.all(8),
            child: AnimatedRotation(
              turns: _turns,
              duration: const Duration(milliseconds: 500),
              child: const FlutterLogo(size: 200,),
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
    setState(() => _turns += 1.0 / 8.0);
  }
}
