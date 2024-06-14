import 'package:flutter/material.dart';

class CustomAnimationPage extends StatefulWidget {
  const CustomAnimationPage({super.key});

  @override
  State<CustomAnimationPage> createState() => _CustomAnimationPageState();
}

class _CustomAnimationPageState extends State<CustomAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _controller.repeat();
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
        title: Text('CustomAnimationPage'),
      ),
      body: Center(child: _custommAnimation()),
    );
  }

  // 系统提供动画做法
  Widget _getSystemAnimation() {
    return Center(
      child: FadeTransition(
        opacity: _controller,
        child: Container(
          width: 300,
          height: 300,
          color: Colors.blue[200],
          alignment: Alignment.center,
          child: Text(
            '123',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }

  // 自定义动画
  Widget _custommAnimation() {
    final Animation heightAnimation =
        Tween(begin: 200.0, end: 300).animate(_controller);
    final Animation opacityAnimation =
        Tween(begin: 0.5, end: 1.0).animate(_controller);
    return Center(
        child: AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          //第一种 直接使用 _controller
          // opacity: _controller.value,
          //第二种 使用 opacityAnimation 值
          // opacity: opacityAnimation.value,
          //第三种 直接执行 Tween 得到值
          opacity: Tween(begin: 0.5, end: 1.0).evaluate(_controller),
          child: Container(
              width: 300,
              height: heightAnimation.value,
              color: Colors.blue[200],
              alignment: Alignment.center,
              child: child),
        );
      },
      child: Text(
        '123',
        style: TextStyle(fontSize: 30),
      ),
    ));
  }
}
