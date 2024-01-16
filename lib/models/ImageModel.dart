import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ImageType { LOCAL, NETWORK }

class ImageModel extends Equatable {
  String path;
  ImageType type;
  ImageModel({
    required this.path,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'type': type,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      path: map['path'] ?? '',
      type: map['type'] ?? '',
    );
  }

  render() {
    if (type == ImageType.LOCAL) {
      return Image.asset(path);
    } else {
      return Image.network(path);
    }
  }

  @override
  List<Object> get props => [path, type];
}
