import 'package:flutter/material.dart';

class AnimationType {
  String name;
  IconData icon;
  String description;
  String route;
  String urlTutorial;
  String urlVideo;

  AnimationType({
    required this.name,
    required this.icon,
    required this.description,
    required this.route,
    required this.urlTutorial,
    required this.urlVideo,
  });
}

class ListAnimationsView extends StatelessWidget {
  ListAnimationsView({Key? key}) : super(key: key);

  final List<AnimationType> animations = [
    AnimationType(
      urlTutorial: 'https://docs.flutter.dev/development/ui/animations',
      urlVideo: 'https://www.youtube.com/watch?v=IVTjpW3W33s&feature=emb_imp_woyt',
      name: 'Implicit Animations',
      route: '/implicit_animations',
      description:
          'O Flutter inclui uma série de widgets que são versões animadas de widgets existentes',
      icon: Icons.favorite,
    ),
    AnimationType(
      urlTutorial: 'https://pub.dev/packages/lottie',
      urlVideo: 'https://www.youtube.com/watch?v=EheXY1-10i0',
      name: 'TweenAnimationBuilder',
      route: '/tweenanimationbuilder',
      description:
          'Suponha que você queira criar uma animação básica : uma animação que não se repete para sempre e é apenas um widget ou árvore de widgets.',
      icon: Icons.blur_circular,
    ),
    AnimationType(
      urlTutorial: 'https://pub.dev/packages/lottie',
      urlVideo: 'https://www.youtube.com/watch?v=EheXY1-10i0',
      name: 'Built-in Explicit Animations',
      route: '/built_in_explicit_animations',
      description:
          'Para criar uma animação explícita, onde você controla a animação, em vez de deixar a estrutura controlá-la.',
      icon: Icons.shuffle,
    ),
    AnimationType(
      urlTutorial: 'https://pub.dev/packages/lottie',
      urlVideo: 'https://www.youtube.com/watch?v=EheXY1-10i0',
      name: 'AnimatedBuilder e Animated Widget',
      route: '/animatedbuilder_e_animated_widget',
      description: 'Se você precisar criar uma animação explícita do zero.',
      icon: Icons.flag,
    ),
    AnimationType(
      urlTutorial: 'https://pub.dev/packages/lottie',
      urlVideo: 'https://www.youtube.com/watch?v=EheXY1-10i0',
      name: 'Animation Deep Dive',
      route: '/animation_deep_dive',
      description:
          'Para uma compreensão mais profunda de como as animações funcionam no Flutter.',
      icon: Icons.school,
    ),
    AnimationType(
      urlTutorial: 'https://pub.dev/packages/lottie',
      urlVideo: 'https://www.youtube.com/watch?v=EheXY1-10i0',
      name: 'Lottie',
      route: '/lottie',
      description:
          'Lottie é uma biblioteca que analisa animações do Adobe After Effects exportadas como json com Bodymovin e as renderiza nativamente em dispositivos móveis!',
      icon: Icons.animation,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 160.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Tipos de animação'),
                background: Hero(
                  tag: 'mickey-hero-animation',
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.grey.shade600, BlendMode.modulate),
                    child: Image.network(
                      'https://forums-images.oneplus.net/data/webimg/2021/01-29/6013f8a5d4e10.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 50,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Alguns exemplos do que podemos usar',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final animation = animations[index];
                  return Hero(
                    tag: animation.route,
                    child: Card(
                      child: ListTile(
                        leading: Icon(animation.icon),
                        title: Text(animation.name),
                        subtitle: Text(animation.description),
                        onTap: () {
                          Navigator.pushNamed(context, animation.route,
                              arguments: animation);
                        },
                      ),
                    ),
                  );
                },
                childCount: animations.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
