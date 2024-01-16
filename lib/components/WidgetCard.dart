import 'package:flutter/material.dart';
import 'package:fluttergamer/models/WidgetCardModel.dart';

class WidgetCard extends StatelessWidget {
  final WidgetCardModel widgetCardModel;
  const WidgetCard({super.key, required this.widgetCardModel});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: widgetCardModel.widgetWrapperModel,
      feedback: Container(
        width: 64,
        height: 64,
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.all(2),
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: widgetCardModel.image.render(),
              ),
            ),
            Text(widgetCardModel.name),
            // widgetCardModel.widgetWrapperModel.render(),
          ],
        ),
      ),
    );
  }
}
