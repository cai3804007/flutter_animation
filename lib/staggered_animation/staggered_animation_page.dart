import 'package:flutter/material.dart';

class StaggeredAnimationPage extends StatefulWidget {
  const StaggeredAnimationPage({super.key});

  @override
  State<StaggeredAnimationPage> createState() => _StaggeredAnimationPageState();
}

class _StaggeredAnimationPageState extends State<StaggeredAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('交错动画StaggeredAnimationPage'),
        backgroundColor: Colors.deepPurple[100],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlidingBox(_controller, Colors.blue[100]!, const Interval(0.0, 0.2)),
          SlidingBox(_controller, Colors.blue[300]!, Interval(0.2, 0.4)),
          SlidingBox(_controller, Colors.blue[500]!, Interval(0.4, 0.6)),
          SlidingBox(_controller, Colors.blue[700]!, Interval(0.6, 0.8)),
          SlidingBox(_controller, Colors.blue[900]!, Interval(0.8, 1.0)),
        ],
      )),
    );
  }
}

class SlidingBox extends StatelessWidget {
  final AnimationController controller;
  final Color color;
  final Interval interval;

  const SlidingBox(this.controller, this.color, this.interval);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: Tween(begin: Offset.zero, end: const Offset(0.1, 0))
            .chain(CurveTween(curve: interval))
            // .chain(CurveTween(curve: Curves.bounceInOut))
            .animate(controller),
        child: Container(
          width: 300,
          height: 100,
          color: color,
        ));
  }
}
