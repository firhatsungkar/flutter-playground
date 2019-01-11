import 'package:flutter/material.dart';

class FlutterAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: LogoFade(),),
    );
  }
}

class LogoFade extends StatefulWidget {
  LogoFade({Key key,}) : super(key: key,);
  @override
  State<StatefulWidget> createState() => _LogoFadeState();
}

class _LogoFadeState extends State<LogoFade> with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this
    );
    final CurvedAnimation curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(curve);
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        height: 300,
        width: 300,
        child: FlutterLogo(),
      ),
    );
  }

  @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }
} 