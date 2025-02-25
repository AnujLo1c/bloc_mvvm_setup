library;
import 'package:flutter/material.dart';
part 'assets.dart';
part 'colors.dart';
part 'fonts.dart';
part 'dimensions.dart';
class R {
  R._();

  static final _ResDimensions dimensions = _ResDimensions();
  static final _ResColors colors = _ResColors();
  static final _ResAssets assets = _ResAssets();
  static final _ResFonts fonts = _ResFonts();

}