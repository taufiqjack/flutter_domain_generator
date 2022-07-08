import 'package:domaingen/core/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.push(
          context,
          PageTransition(
            child: const HomeView(),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 1000),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/domainku.png',
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
