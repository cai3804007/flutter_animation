import 'package:flutter/material.dart';

class Transition extends StatefulWidget {
  const Transition({super.key});

  @override
  State<Transition> createState() => _TransitionState();
}

class _TransitionState extends State<Transition>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_TransitionState'),
        backgroundColor: Colors.deepPurple[100],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.repeat(reverse: true);
      }),
      body: Center(
        child: SlideTransition(
          position: Tween(begin: Offset(0.0, -0.5), end: Offset(0.0, 0.8))
              .chain(CurveTween(curve: Curves.easeOutSine))
              //动画前面50%静止,后面0.5-1.0完成
              .chain(CurveTween(curve: Interval(0.5, 1.0)))
              .animate(controller),
          // scale: controller,
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
