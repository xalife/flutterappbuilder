import 'package:flutter/material.dart';
import 'package:fluttergamer/components/WidgetCard.dart';
import 'package:fluttergamer/helper/GeneralHelper.dart';
import 'package:fluttergamer/home/PhoneView.dart';
import 'package:fluttergamer/models/AbstractModels.dart/WidgetPatternModel.dart';
import 'package:fluttergamer/models/ImageModel.dart';
import 'package:fluttergamer/models/WidgetCardModel.dart';
import 'package:fluttergamer/models/WidgetModels.dart/RowModel.dart';
import 'package:fluttergamer/models/WidgetModels.dart/TextModel.dart';
import 'package:fluttergamer/models/factories/RowModelFactory.dart';
import 'package:fluttergamer/models/factories/TextModelFactory.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PhoneOrientation _orientation = PhoneOrientation.LANDSCAPE;
  bool isDragging = false;
  double leverPosition = 100;

  @override
  void initState() {
    FactoryHelper helper = FactoryHelper();

    helper.registerFacotry(TextModelFactory());
    helper.registerFacotry(RowModelFactory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.teal,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        _orientation == PhoneOrientation.LANDSCAPE ? "LANDSCAPE" : "PORTRAIT",
                      ),
                      Switch(
                        value: _orientation == PhoneOrientation.LANDSCAPE,
                        onChanged: (val) {
                          setState(() {
                            _orientation = val ? PhoneOrientation.LANDSCAPE : PhoneOrientation.PORTRAIT;
                          });
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Color.fromARGB(255, 89, 207, 111),
                      child: Column(
                        children: [
                          WidgetCard(
                            widgetCardModel: WidgetCardModel(
                              name: "Text",
                              image: ImageModel(
                                path: "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png",
                                type: ImageType.NETWORK,
                              ),
                              widgetWrapperModel: TextWidgetModel(
                                params: TextParams(text: "asdsd"),
                              ),
                            ),
                          ),
                          WidgetCard(
                            widgetCardModel: WidgetCardModel(
                              name: "Row",
                              image: ImageModel(
                                path: "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png",
                                type: ImageType.NETWORK,
                              ),
                              widgetWrapperModel: RowModel(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: leverPosition,
            child: Stack(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.resizeLeftRight,
                  child: GestureDetector(
                    onPanUpdate: (e) {
                      setState(() {
                        leverPosition -= e.delta.dx;
                      });
                    },
                    child: Container(
                      width: 3,
                      height: double.infinity,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Expanded(
                        child: PhoneView(
                          orientation: _orientation,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
