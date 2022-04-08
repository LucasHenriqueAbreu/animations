import 'package:animations/core/default_view.dart';
import 'package:animations/list-animations/list_animations_view.dart';
import 'package:flutter/material.dart';

class TweenAnimationBuilderDetailsView extends StatelessWidget {
  final AnimationType animationType;
  const TweenAnimationBuilderDetailsView({ Key? key, required this.animationType }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return DefaultView(
      animationType: animationType,
      markdownCode: 'implicitAnimationDoc',
      childTabAnimacao: _buidAnimations(),
    );
  }

  _buidAnimations() {}
}