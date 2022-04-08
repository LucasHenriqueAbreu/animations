import 'package:animations/core/default_view.dart';
import 'package:animations/list-animations/list_animations_view.dart';
import 'package:flutter/material.dart';

const String _notes = """
# Markdown syntax guide

```Dart
class _LottieDetailsViewState extends State<LottieDetailsView>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Animação'),
    Tab(text: 'Código'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: widget.animationType.route,
          child: Row(
            children: [
              Icon(widget.animationType.icon),
              const SizedBox(
                width: 10,
              ),
              Text(widget.animationType.name)
            ],
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return const Markdown(data: _notes);
        }).toList(),
      ),
      bottomNavigationBar: ButtonBar(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text('Vídeo oficial'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Aprenda mais'),
          ),
        ],
      ),
    );
  }
```

""";

class LottieDetailsView extends StatelessWidget {
  final AnimationType animationType;

  const LottieDetailsView({Key? key, required this.animationType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultView(
      animationType: animationType,
      markdownCode: _notes,
      childTabAnimacao: const Text('teste'),
      
    );
  }
}
