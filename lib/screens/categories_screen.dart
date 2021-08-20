import 'package:flutter/material.dart';
import 'package:meals_app/utils/sizeConfig.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig();
    sc.init(context);
    final _screenHeight = sc.screenHeight;
    final _screenWidth = sc.screenWidth;
    return GridView(
      children: <Widget>[],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: _screenWidth * 0.5,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: _screenWidth * 0.05,
        crossAxisSpacing: _screenWidth * 0.05,
      ),
    );
  }
}
