import 'package:flutter/material.dart';

class BasicAnimationPage extends StatefulWidget {
  const BasicAnimationPage({super.key});

  @override
  State<BasicAnimationPage> createState() => _BasicAnimationPageState();
}

class _BasicAnimationPageState extends State<BasicAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_BasicAnimationPageState'),
        backgroundColor: Colors.deepPurple[100],
      ),

      // baseContainer()
      body: twwenAnimation(),
    );
  }

  twwenAnimation() {
    return Center(
      child: TweenAnimationBuilder(
        duration: Duration(seconds: 1),
        tween: Tween(
            begin: 0.0, end: 1.0), //补间 从begin到end  begin 只在程序开始时有效,之后是每次都是end值
        builder: (BuildContext context, value, Widget? child) {
          return Opacity(
            opacity: value,
            child: Transform.scale(
              // 平移 缩放 旋转
              scale: value,
              child: Transform.rotate(
                angle: value,
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 300,
                  color: Colors.red,
                  child: Transform.translate(
                    offset: Offset(-10, -40),
                    child: Text(
                      'HI',
                      style: TextStyle(fontSize: 50 * value),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  baseLine() {
    return AnimatedPadding(
      padding: EdgeInsets.all(8),
      duration: Duration(seconds: 2),
      child: Container(
        width: 300,
        height: 300,
        color: Colors.red,
      ),
    );
  }

  baseContainer() {
    // AnimatedCrossFadeBuilder   或者
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 2000),
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Colors.orange, Colors.white],
                stops: [0.2, 0.3],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
            boxShadow: const [BoxShadow(spreadRadius: 25, blurRadius: 25)],
            borderRadius: BorderRadius.circular(150.0)),
        child: AnimatedSwitcher(
          //控件切换时的动画
          duration: Duration(seconds: 2),
          child: Text('5555', key: UniqueKey()),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}
