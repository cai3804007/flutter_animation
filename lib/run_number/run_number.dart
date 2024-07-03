import 'package:flutter/material.dart';

import 'counter.dart';

class RunNumberPage extends StatefulWidget {
  const RunNumberPage({super.key});

  @override
  State<RunNumberPage> createState() => _RunNumberPageState();
}

class _RunNumberPageState extends State<RunNumberPage> {
  late var count = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_RunNumberPageState'),
        backgroundColor: Colors.deepPurple[100],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          count++;
        });
      }),
      body: Center(
        child: Container(
          width: 300,
          height: 120,
          color: Colors.blue,
          child: Counter(value: count),
        ),
      ),
    );
  }
}
