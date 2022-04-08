import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChoosingApproach extends StatefulWidget {
  const ChoosingApproach({Key? key}) : super(key: key);

  @override
  State<ChoosingApproach> createState() => _ChoosingApproachState();
}

class _ChoosingApproachState extends State<ChoosingApproach>
    with TickerProviderStateMixin {
  double _scaleCircle = 0;
  double _topPositionLottie = -1000;
  double _rightPositionLottie = -1000;
  final String urlLottieAnimation =
      'https://assets9.lottiefiles.com/packages/lf20_hz4zkrb4.json';

  @override
  void initState() {
    super.initState();
    _setChangesAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue.shade300,
        child: Stack(
          children: [
            Positioned(
              top: -350,
              left: -400,
              child: AnimatedScale(
                scale: _scaleCircle,
                duration: const Duration(milliseconds: 500),
                child: _buildCircle(),
              ),
            ),
            _buildAnimationLottie(),
            _buildTextInfo(),
            _buildDecisionActions(),
          ],
        ),
      ),
    );
  }

  Future<void> _setChangesAnimations() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _scaleCircle = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _topPositionLottie = 0;
      _rightPositionLottie = 0;
    });
  }

  Widget _buildCircle() {
    return Container(
      height: 750,
      width: 750,
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildAnimationLottie() {
    return AnimatedPositioned(
      top: _topPositionLottie,
      right: _rightPositionLottie,
      child: SizedBox(
        width: 400,
        height: 400,
        child: Lottie.network(urlLottieAnimation),
      ),
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  Widget _buildTextInfo() {
    return Positioned(
      bottom: 50,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left:10, bottom: 50, right: 50),
        child: Column(
          children: [
            Text(
              'Eu quero uma animação no Flutter!',
              style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black45),
            ),
            Text(
              'Minha animação é mais como um desenho? Minha animação envolve movimento de layout muito além de primitivos padrão, como linhas e colunas',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDecisionActions() {
    return Positioned(
      bottom: 0,
      child: Container(
        color: Colors.blue.shade300,
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.thumb_up, color: Colors.blue),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.thumb_down, color: Colors.blue,),
            )
          ],
        ),
      ),
    );
  }
}
