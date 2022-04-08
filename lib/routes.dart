import 'package:animations/choosing-approach/choosing_approach_view.dart';
import 'package:animations/details/animated-builder-animated_widget/animated_builder_e_animated_widget_details_view.dart';
import 'package:animations/details/deep-dive/animation_deep_dive_details_view.dart';
import 'package:animations/details/built_in/built_in_explicit_animations_details_view.dart';
import 'package:animations/details/implicit/implicit_animations_details_view.dart';
import 'package:animations/details/lottie/lottie_details_view.dart';
import 'package:animations/details/tween/tween_animation_builder_details_view.dart';
import 'package:animations/list-animations/list_animations_view.dart';
import 'package:flutter/material.dart';

import 'home/home_view.dart';

class CustomRoutes {
  static Route? onGeneratedRoute(RouteSettings settings) {
    var rota = settings.name;
    var args = settings.arguments;
    late Widget view;
    switch (rota) {
      case '/':
        view = const HomeView();
        break;
      case '/list-animations':
        view = ListAnimationsView();
        break;
      case '/implicit_animations':
        var params = args as AnimationType;
        view = ImplicitAnimationsDetailsView(animationType: params,);
        break;
      case '/tweenanimationbuilder':
        var params = args as AnimationType;
        view = TweenAnimationBuilderDetailsView(animationType: params,);
        break;
      case '/built_in_explicit_animations':
        var params = args as AnimationType;
        view = BuiltInExplicitAnimationsDetailsView(animationType: params,);
        break;
      case '/animatedbuilder_e_animated_widget':
        var params = args as AnimationType;
        view = AnimatedBuilderAnimatedWidgetDetailsView(animationType: params,);
        break;
      case '/animation_deep_dive':
        var params = args as AnimationType;
        view = AnimationDeepDiveDetailsView(animationType: params,);
        break;
      case '/lottie':
        var params = args as AnimationType;
        view = LottieDetailsView(animationType: params,);
        break;
      case '/choosing_approach':
        view = const ChoosingApproach();
        break;
      default:
        return null;
    }

    return MaterialPageRoute(builder: (_) => view);
  }
}