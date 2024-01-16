import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttergamer/components/DraggablePlace.dart';
import 'package:fluttergamer/components/SingleWidgetWrapper.dart';
import 'package:fluttergamer/models/AbstractModels.dart/WidgetPatternModel.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        // etc.
      };
}

class RenderedApp extends StatefulWidget {
  final List<WidgetPatternModel> widgets;
  const RenderedApp({super.key, required this.widgets});

  @override
  State<RenderedApp> createState() => _RenderedAppState();
}

class _RenderedAppState extends State<RenderedApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.abc_outlined,
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return DraggablePlace(
              onAdded: (details) {},
              child: Text("Drop Here"),
            );
          },
          itemCount: widget.widgets.length,
          itemBuilder: (context, index) {
            return SingleWidgetWrapper(
              model: widget.widgets[index],
            );
          },
        ),
      ),
    );
  }
}
