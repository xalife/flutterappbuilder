import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttergamer/components/DraggablePlace.dart';
import 'package:fluttergamer/models/AbstractModels.dart/ParamModel.dart';
import 'package:fluttergamer/models/AbstractModels.dart/WidgetPatternModel.dart';

class RowParams extends ParamsModel {}

class RowModel extends WidgetPatternModel {
  List<WidgetPatternModel>? children = [];

  RowModel({super.paramsModel, this.children});

  @override
  Widget editState() {
    return Row(
      children: children!.map((e) => Expanded(child: e.editState())).toList(),
    );
  }

  @override
  onEditStateClose() {
    reRender();
  }

  @override
  onEditStateOpen() {}

  @override
  Widget render() {
    return DraggablePlace(
      child: Row(
        children: [
          if (children != null) ...children!.map((e) => Expanded(child: e.render())).toList(),
        ],
      ),
      onAdded: (details) {
        print("DETAİLLLs");
        children ??= [];
        children!.add(details.data);
        reRender();
      },
    );
  }
}
