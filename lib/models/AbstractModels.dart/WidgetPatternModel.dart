import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttergamer/models/AbstractModels.dart/ParamModel.dart';
import 'package:fluttergamer/models/factories/WidgetPatternFactory.dart';

abstract class WidgetPatternModel<T> {
  ParamsModel? paramsModel;

  Function()? onListenCall;
  WidgetPatternModel? child;
  Widget render();
  Widget editState();
  onEditStateOpen();
  listen(callBack) {
    onListenCall = callBack;
  }

  reRender() {
    if (onListenCall != null) onListenCall!();
  }

  onEditStateClose();

  WidgetPatternModel({this.paramsModel, this.child, this.onListenCall});
}
