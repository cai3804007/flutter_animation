import 'package:flutter/material.dart';
import 'package:flutter_animation/run_number/run_number.dart';
import 'package:flutter_animation/staggered_animation/staggered_animation_page.dart';
import 'package:flutter_animation/transition/transition.dart';
import 'package:flutter_animation/tween_animation/tween_animation.dart';
import 'package:flutter_animation/two_animation/two_animation_page.dart';

import 'basic_animation.dart';
import 'custom_animation/custom_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // Map<dynamic, dynamic> list = {'交错动画': StaggeredAnimationPage()};
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Map<String, WidgetBuilder> pages = {};
    // list.forEach((key, value) {
    //   pages[key] = (context) => value;
    // });
    return MaterialApp(
      title: 'Animation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      // routes: pages,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final listString = [
    'BasicAnimationPage',
    'RunNumberPage',
    'Transition',
    '补间动画TweenAnimationPage',
    '交错动画StaggeredAnimationPage',
    'CustomAnimationPage',
    'TwoAnimationController'
  ];
  final pages = [
    BasicAnimationPage(),
    RunNumberPage(),
    Transition(),
    TweenAnimationPage(),
    StaggeredAnimationPage(),
    CustomAnimationPage(),
    TwoAnimationController()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView.separated(
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder,
            itemCount: listString.length));
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          _pushToPage(context, index);
        },
        child: ListTile(title: Text(listString[index])));
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const Divider();
  }

  _pushToPage(BuildContext context, int index) {
    Widget page = pages[index];
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
