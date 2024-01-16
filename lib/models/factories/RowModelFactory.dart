import 'package:flutter/material.dart';
import 'package:fluttergamer/components/DraggablePlace.dart';
import 'package:fluttergamer/models/AbstractModels.dart/WidgetPatternModel.dart';
import 'package:fluttergamer/models/WidgetModels.dart/RowModel.dart';
import 'package:fluttergamer/models/WidgetModels.dart/TextModel.dart';
import 'package:fluttergamer/models/factories/WidgetPatternFactory.dart';

class RowModelFactory extends WidgetPatternFactory<RowModel> {
  @override
  RowModel create(RowModel model) {
    return RowModel();
  }
}
