import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:fluttergamer/models/AbstractModels.dart/WidgetPatternModel.dart';
import 'package:fluttergamer/models/ImageModel.dart';

class WidgetCardModel extends Equatable {
  String name;
  ImageModel image;
  WidgetPatternModel widgetWrapperModel;
  WidgetCardModel({
    required this.name,
    required this.image,
    required this.widgetWrapperModel,
  });

  WidgetCardModel copyWith({
    String? name,
    ImageModel? image,
    WidgetPatternModel? widgetWrapperModel,
  }) {
    return WidgetCardModel(
      name: name ?? this.name,
      image: image ?? this.image,
      widgetWrapperModel: widgetWrapperModel ?? this.widgetWrapperModel,
    );
  }

  // factory WidgetCardModel.fromMap(Map<String, dynamic> map) {
  //   return WidgetCardModel(
  //     name: map['name'] ?? '',
  //     image: ImageModel.fromMap(map['image']),
  //     widgetWrapperModel: WidgetPatternModel(par)
  //   );
  // }

  @override
  List<Object> get props => [name, image, widgetWrapperModel];
}
