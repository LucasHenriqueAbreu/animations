const String implicitAnimationDoc = ''''
# ImplicitAnimations
O Flutter inclui uma série de widgets que são versões animadas de widgets existentes


## AnimatedAlign
Versão animada de Align que muda automaticamente a posição da child em uma determinada duração sempre que o alinhamento especificado é alterado.

```dart
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
```

## AnimatedContainer
Versão animada do Container que muda gradualmente seus valores ao longo de um período de tempo.

```dart
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

```

## AnimatedRotation
Versão animada de Transform.rotate que faz a transição automática da rotação do child em uma determinada duração sempre que a rotação especificada for alterada.

```dart
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

```

## AnimatedScale
Versão animada de Transform.scale que faz a transição automática da escala do child em uma determinada duração sempre que a escala especificada for alterada.

```dart
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

```

## AnimatedSwitcher
Um widget que, por padrão, faz um cross-fade entre um novo widget e o widget definido anteriormente no child do AnimatedSwitcher
```dart

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
            title: Text('Veja um FizzBuzz ;) usando esta animação:'),
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
```

Veja mais na própria [documentação](https://api.flutter.dev/flutter/widgets/ImplicitlyAnimatedWidget-class.html)

''';
