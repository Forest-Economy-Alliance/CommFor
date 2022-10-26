import 'package:flutter/material.dart';
import 'package:ifri/splash2.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.bottomToTop,
            child: const Splash2(),
            duration: const Duration(milliseconds: 1500),
            childCurrent: Container(
              key: const Key("1"),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: const Color(0x0012160f),
        ),
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Center(
              child: Image.asset(
                "assets/Colored Logo@3x.png",
                height: size.height * 0.5,
                width: size.width * 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
