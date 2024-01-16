import 'package:flutter/material.dart';
import 'package:fluttergamer/models/AbstractModels.dart/WidgetPatternModel.dart';

enum SingleWidgetStateENUM { EDIT, REGULAR }

class SingleWidgetWrapper extends StatefulWidget {
  final WidgetPatternModel model;
  const SingleWidgetWrapper({super.key, required this.model});

  @override
  State<SingleWidgetWrapper> createState() => _SingleWidgetWrapperState();
}

class _SingleWidgetWrapperState extends State<SingleWidgetWrapper> {
  SingleWidgetStateENUM currentState = SingleWidgetStateENUM.REGULAR;
  listenReRender() {
    widget.model.listen(() {
      setState(() {});
    });
  }

  _renderTheWidgetWrapperModel() {
    switch (currentState) {
      case SingleWidgetStateENUM.EDIT:
        widget.model.onEditStateOpen();
        return widget.model.editState();
      case SingleWidgetStateENUM.REGULAR:
        widget.model.onEditStateClose();
        return widget.model.render();
      default:
        // widget.model.onEditStateOpen();
        return widget.model.render();
    }
  }

  @override
  void initState() {
    listenReRender();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        setState(() {
          currentState = currentState == SingleWidgetStateENUM.REGULAR ? SingleWidgetStateENUM.EDIT : SingleWidgetStateENUM.REGULAR;
        });
      },
      child: _renderTheWidgetWrapperModel(),
    );
  }
}
