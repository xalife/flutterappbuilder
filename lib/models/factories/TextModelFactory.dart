import 'package:fluttergamer/models/AbstractModels.dart/WidgetPatternModel.dart';
import 'package:fluttergamer/models/WidgetModels.dart/TextModel.dart';
import 'package:fluttergamer/models/factories/WidgetPatternFactory.dart';

class TextModelFactory extends WidgetPatternFactory<TextWidgetModel> {
  @override
  TextWidgetModel create(TextWidgetModel model) {
    return TextWidgetModel(params: model.paramsModel as TextParams);
  }
}
