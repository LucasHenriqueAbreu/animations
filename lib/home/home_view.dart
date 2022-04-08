import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  // TODO: revisar
  final String TEXT_ANIMATION =
      'Animações bem projetadas tornam a interface do usuário mais intuitiva, contribuem para a aparência elegante de um aplicativo polido e melhoram a experiência do usuário. O suporte de animação do Flutter facilita a implementação de vários tipos de animação. Muitos widgets, especialmente widgets de material , vêm com os efeitos de movimento padrão definidos em suas especificações de design, mas também é possível personalizar esses efeitos.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: const Text('Animations app')),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  ),
                  child: Hero(
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
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Animações em Flutter',
                          style: Theme.of(context).textTheme.headline5
                        ),
                        subtitle: Text(
                          TEXT_ANIMATION,
                        ),
                      ),
                    ),
                
                    ButtonBar(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/choosing_approach');
                          },
                          child: const Text('Escolhendo uma abordagem'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/list-animations');
                          },
                          child: const Text('Saber mais'),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
