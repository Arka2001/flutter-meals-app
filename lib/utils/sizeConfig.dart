import 'package:flutter/widgets.dart';

class SizeConfig {
  late MediaQueryData _mediaQueryData;
  late double screenWidth;
  late double screenHeight;
  late double blockSizeHorizontal;
  late double blockSizeVertical;

  late double _safeAreaHorizontal;
  late double _safeAreaVertical;
  late double safeBlockHorizontal;
  late double safeBlockVertical;

  late double cardRatio = 0.64;
  late double cardWidth;
  late double cardHeight;
  late double remainingWidth;
  late int x, y;

  // ignore: non_constant_identifier_names
  late double font_size;
  late double textScale;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 338;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 812;

    font_size = (safeBlockVertical + safeBlockHorizontal) / 2;

    cardWidth = screenWidth * 0.9;
    cardHeight = cardWidth * cardRatio;
    remainingWidth = (screenWidth - cardWidth) / 2;
    x = remainingWidth.floor();
    y = ((screenHeight - cardHeight) / 2).floor();
    textScale = MediaQuery.of(context).textScaleFactor;
  }
}
