import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttergamer/components/DraggablePlace.dart';
import 'package:fluttergamer/helper/GeneralHelper.dart';
import 'package:fluttergamer/home/RenderedApp.dart';
import 'package:fluttergamer/models/AbstractModels.dart/WidgetPatternModel.dart';
import 'package:fluttergamer/models/WidgetModels.dart/TextModel.dart';
import 'package:fluttergamer/models/factories/TextModelFactory.dart';

enum PhoneOrientation { LANDSCAPE, PORTRAIT }

class PhoneView extends StatefulWidget {
  final PhoneOrientation orientation;
  const PhoneView({super.key, required this.orientation});

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  double ratio = 0;
  int width = 1284;
  int height = 2778;

  @override
  void initState() {
    setState(() {
      ratio = width / height;
    });

    super.initState();
  }

  List<WidgetPatternModel> widgets = [];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          child: Center(
            child: AspectRatio(
              aspectRatio: pow(ratio, widget.orientation == PhoneOrientation.LANDSCAPE ? 1 : -1).toDouble(),
              child: DraggablePlace(
                onAdded: (details) {
                  FactoryHelper factoryHelper = FactoryHelper();
                  dynamic choosenFactory = factoryHelper.chooseFactory(details.data);
                  if (choosenFactory != null) {
                    // Eğer Buraya Yönlendirilen elementimin Factory Class'ı Kaydedilmişse
                    dynamic d = choosenFactory.create(details.data);

                    widgets.add(d);
                    setState(() {});
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: RenderedApp(
                    widgets: widgets,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
