import 'package:flutter/material.dart';

class TweenAnimationPage extends StatefulWidget {
  const TweenAnimationPage({super.key});

  @override
  State<TweenAnimationPage> createState() => _TweenAnimationPageState();
}

class _TweenAnimationPageState extends State<TweenAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('补间动画TweenAnimationPage'),
        backgroundColor: Colors.deepPurple[100],
      ),
      body: Center(
          child: SlideTransition(
        position: Tween(begin: Offset(0, 0), end: Offset(0, 0.5))
            .chain(CurveTween(curve: Curves.bounceInOut))
            //Interval   动画从0.5的时刻开始,0.0-0.5之间不做动画
            .chain(CurveTween(curve: Interval(0.5, 1)))
            .animate(_controller),
        // position:
        //     _controller.drive(Tween(begin: Offset(0, 0), end: Offset(0.1, 0))),
        // scale: _controller,
        // scale: _controller.drive(Tween(begin: 0.5, end: 1.0)),
        child: Container(
          color: Colors.blue[200],
          width: 300,
          height: 300,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.repeat();
          }
        },
      ),
    );
  }
}
