import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final double value;
  const Counter({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(end: value),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, value, Widget? child) {
        final whole = value ~/ 1;
        final decimal = value - whole;
        print('whole === $whole   decimal === $decimal');
        return Stack(
          children: [
            Positioned(
                top: -100 * decimal, // 0 -> -100
                child: Opacity(
                  opacity: 1 - decimal,
                  child: Text(
                    '$whole',
                    style: TextStyle(fontSize: 100),
                  ),
                )),
            Positioned(
                top: 100 - decimal * 100, // 100 ->0
                child: Opacity(
                  opacity: decimal,
                  child: Text(
                    '${whole + 1}',
                    style: TextStyle(fontSize: 100),
                  ),
                )),
          ],
        );
      },
    );
  }
}
