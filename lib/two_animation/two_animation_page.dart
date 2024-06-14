import 'package:flutter/material.dart';

class TwoAnimationController extends StatefulWidget {
  const TwoAnimationController({super.key});

  @override
  State<TwoAnimationController> createState() => _TwoAnimationControllerState();
}

class _TwoAnimationControllerState extends State<TwoAnimationController>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _opacityController;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 20))
          ..addListener(() {
            if (_controller.value > 0.2 && _controller.value < 0.55) {
              print(_opacityController.value);
              _opacityController.repeat();
            } else {
              _opacityController.value = 1.0;
              _opacityController.stop();
            }
          });
    _opacityController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1116));
    _opacityController.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    _opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 4秒吸 停7秒 8秒呼 最后停1s 一共20s
    Animation xiAnimation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Interval(0.0, 0.2)))
        .animate(_controller);
    Animation huAnimation = Tween(begin: 1.0, end: 0.0)
        .chain(CurveTween(curve: Interval(0.55, 0.95)))
        .animate(_controller);
    Animation opcityAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_opacityController);

    return Scaffold(
      appBar: AppBar(
        title: Text('TwoAnimationController'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: _opacityController,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  gradient: RadialGradient(
                      colors: [Colors.blue.shade600, Colors.blue.shade100],
                      stops: _controller.value < 0.2
                          ? [xiAnimation.value, xiAnimation.value + 0.1]
                          : [huAnimation.value, huAnimation.value + 0.1]),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            if (_controller.isAnimating) {
              _controller.stop();
            } else {
              _controller.repeat();
            }
          }),
    );
  }
}
