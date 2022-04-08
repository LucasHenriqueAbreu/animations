import 'package:animations/core/default_view.dart';
import 'package:animations/core/docs/implicit.dart';
import 'package:animations/details/implicit/animations/animated-align/animated_align_widget.dart';
import 'package:animations/details/implicit/animations/animated-container/animated_container_widget.dart';
import 'package:animations/details/implicit/animations/animated-rotation/animated_rotation_widget.dart';
import 'package:animations/details/implicit/animations/animated-scale/animated_scale_widget.dart';
import 'package:animations/details/implicit/animations/animated-switcher/animated_switcher_widget.dart';
import 'package:animations/list-animations/list_animations_view.dart';
import 'package:flutter/material.dart';

class ImplicitAnimationsDetailsView extends StatelessWidget {
  final AnimationType animationType;
  const ImplicitAnimationsDetailsView({Key? key, required this.animationType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultView(
      animationType: animationType,
      markdownCode: implicitAnimationDoc,
      childTabAnimacao: _buidAnimations(),
    );
  }

  Widget _buidAnimations() {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Text('Alguns exemplos, não estão todos, mas os mais utilizados'),
        ),
        Divider(),
        AnimatedContainerWidget(),
        AnimatedAlignWidget(),
        AnimatedScaleWidget(),
        AnimatedRotationWidget(),
        AnimatedSwitcherWidget()
      ],
    );
  }
}
