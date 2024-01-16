import 'package:fluttergamer/models/AbstractModels.dart/WidgetPatternModel.dart';

abstract class WidgetPatternFactory<T> {
  getType() {
    return T;
  }

  T create(T model);
}
