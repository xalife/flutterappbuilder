import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttergamer/models/AbstractModels.dart/ParamModel.dart';
import 'package:fluttergamer/models/AbstractModels.dart/WidgetPatternModel.dart';

class TextParams extends ParamsModel {
  String text;
  TextStyle? style;
  TextParams({required this.text, this.style});
}

class TextWidgetModel extends WidgetPatternModel {
  final TextParams params;

  FocusNode _focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  TextWidgetModel({required this.params, super.child}) : super(paramsModel: params) {
    _controller.text = params.text;
  }

  onClick() {}

  @override
  Widget render() {
    return Text(
      params.text,
      style: params.style,
    );
  }

  @override
  Widget editState() {
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
    );
  }

  @override
  onEditStateClose() {
    params.text = _controller.text;
  }

  @override
  onEditStateOpen() {
    _focusNode.requestFocus();
  }
}
