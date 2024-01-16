import 'package:fluttergamer/models/factories/WidgetPatternFactory.dart';

class FactoryHelper {
  List<WidgetPatternFactory> _list = [];
  static final FactoryHelper _singleton = FactoryHelper._internal();

  factory FactoryHelper() {
    return _singleton;
  }

  FactoryHelper._internal();

  registerFacotry<T>(WidgetPatternFactory factory) {
    _list.add(factory);
  }

  WidgetPatternFactory? chooseFactory<T>(type) {
    WidgetPatternFactory? myFactory;
    _list.forEach((element) {
      if (element.getType() == type.runtimeType) {
        myFactory = element;
      }
    });

    return myFactory;
  }
}
