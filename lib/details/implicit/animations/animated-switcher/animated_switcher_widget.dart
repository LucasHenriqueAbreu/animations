import 'package:flutter/material.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  const AnimatedSwitcherWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitcherWidget> createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text('AnimatedSwitcher'),
            subtitle: Text(
              'Um widget que, por padrão, faz um cross-fade entre um novo widget e o widget definido anteriormente no child do AnimatedSwitcher.\n\nVeja um FizzBuzz ;) usando esta animação:',
            ),
          ),
          Container(
            height: 250,
            padding: const EdgeInsets.all(8),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Text(
                _getText(),
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.headline4,
              ),
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

  String _getText() {
    if (_count % 5 == 0 && _count % 3 == 0) {
      return 'FizzBuzz';
    }

    if (_count % 3 == 0) {
      return 'Fizz';
    }

    if (_count % 5 == 0) {
      return 'Buzz';
    }

    return _count.toString();
  }

  void _changeAnimation() {
    setState(() {
      _count += 1;
    });
  }
}
