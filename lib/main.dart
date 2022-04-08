import 'package:animations/details/animated-builder-animated_widget/animated_builder_e_animated_widget_details_view.dart';
import 'package:animations/details/deep-dive/animation_deep_dive_details_view.dart';
import 'package:animations/details/built_in/built_in_explicit_animations_details_view.dart';
import 'package:animations/details/implicit/implicit_animations_details_view.dart';
import 'package:animations/details/lottie/lottie_details_view.dart';
import 'package:animations/details/tween/tween_animation_builder_details_view.dart';
import 'package:animations/home/home_view.dart';
import 'package:animations/list-animations/list_animations_view.dart';
import 'package:animations/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: CustomRoutes.onGeneratedRoute,
    );
  }
}
