import 'dart:math';

import 'package:flutter/material.dart';

import '../header.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  AnimatedContainerDemoState createState() => AnimatedContainerDemoState();
}

class AnimatedContainerDemoState extends State<AnimatedContainerPage> {
  double width = 100;
  double height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedContainer")),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: random(),
            borderRadius: borderRadius(),
            boxShadow: [
              BoxShadow(
                color: random(),
                spreadRadius: spreadRadius(),
                blurRadius: blurRadius(),
              )
            ],
            border: Border.all(color: random(), width: Random().nextDouble() * 5),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshContainer,
        child: const Icon(Icons.refresh),
      ),
    );
  }



  BorderRadius borderRadius() {
    return BorderRadius.circular(Random().nextDouble() * 50.0);
  }

  double spreadRadius() {
    return Random().nextDouble() * 20.0;
  }

  double blurRadius() {
    return Random().nextDouble() * 20.0;
  }

  void _refreshContainer() {
    if (!mounted) return;
    setState(() {
      width += 50;
      height += 50;
      if (width > 300) {
        width = 50;
        height = 50;
      }
    });
  }
}
