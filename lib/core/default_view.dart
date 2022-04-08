import 'package:animations/list-animations/list_animations_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';


class DefaultView extends StatefulWidget {
  final AnimationType animationType;
  final Widget childTabAnimacao;
  final String markdownCode;

  const DefaultView({
    Key? key,
    required this.animationType,
    required this.childTabAnimacao,
    required this.markdownCode,
  }) : super(key: key);

  @override
  State<DefaultView> createState() => _DefaultViewState();
}

class _DefaultViewState extends State<DefaultView>
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
        children: myTabs.map((Tab tab) => _buildCurrentTab(tab)).toList(),
      ),
      bottomNavigationBar: ButtonBar(
        children: [
          TextButton(
            onPressed: () {
              _launchURL(widget.animationType.urlVideo);
            },
            child: const Text('Vídeo oficial'),
          ),
          TextButton(
            onPressed: () {
              _launchURL(widget.animationType.urlTutorial);
            },
            child: const Text('Aprenda mais'),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentTab(Tab tab) {
    if (tab.text == 'Animação') {
      return widget.childTabAnimacao;
    }
    return Markdown(data: widget.markdownCode);
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
