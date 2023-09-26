import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LinkedPhysicsApp());
}

class BasicUsageApp extends StatelessWidget {
  BasicUsageApp({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: DynMouseScroll(
            controller: controller,
              builder: (context, physics) => ListView(
                    controller: controller,
                    physics: physics,
                    children: List.generate(
                        40,
                        (index) => Container(
                            height: 500,
                            color: (index % 2 == 0)
                                ? Colors.redAccent
                                : Colors.blueAccent)),
                  ))),
    );
  }
}

class CustomSettingsUsageApp extends StatelessWidget {
  CustomSettingsUsageApp({super.key});

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: DynMouseScroll(
              controller: controller,
              durationMS: 500,
              scrollSpeed: 4.4,
              animationCurve: Curves.easeOutQuart,
              builder: (context, physics) => ListView(
                    controller: controller,
                    physics: physics,
                    children: List.generate(
                        40,
                        (index) => Container(
                            height: 500,
                            color: (index % 2 == 0)
                                ? Colors.redAccent
                                : Colors.blueAccent)),
                  ))),
    );
  }
}

class LinkedPhysicsApp extends StatelessWidget {
  const LinkedPhysicsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(children: [
      Expanded(
          child: Row(children: [
        MyScrollingWidget(height: 100, colors: const [Colors.blue, Colors.red]),
        MyScrollingWidget(height: 200, colors: const [Colors.yellow, Colors.green]),
      ])),
      Expanded(
          child: Row(children: [
        MyScrollingWidget(height: 150, colors: const [Colors.purple, Colors.orange]),
        MyScrollingWidget(height: 80, colors: const [Colors.black, Colors.white])
      ]))
    ]))));
  }
}

class MyScrollingWidget extends StatelessWidget {
  final List<Color> colors;
  final double height;

  MyScrollingWidget(
      {Key? key, required this.colors, required this.height})
      : super(key: key);

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DynMouseScroll(
          controller: controller,
            builder: (context, physics) => ListView(
                  controller: controller,
                  physics: physics,
                  children: List.generate(
                      50,
                      (index) => Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: height,
                          color: (index % 2 == 0) ? colors[0] : colors[1])),
                )));
  }
}
