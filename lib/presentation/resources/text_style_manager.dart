import 'package:flutter/material.dart';
import 'color_manager.dart';

class TextStyleManager {
  TextStyleManager._();

  static TextStyle White30ExtraBold = TextStyle(
    color: ColorManager.white,
    fontSize: 30,
    fontWeight: FontWeight.w800,
  );
  static TextStyle White24ExtraBold = TextStyle(
    color: ColorManager.white,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );
  static TextStyle White20Medium = TextStyle(
    color: ColorManager.white,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle White16Bold = TextStyle(
    color: ColorManager.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static TextStyle White16Medium = TextStyle(
    color: ColorManager.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle White16Normal = TextStyle(
    color: ColorManager.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle primary30ExtraBold = TextStyle(
    color: ColorManager.primary,
    fontSize: 30,
    fontWeight: FontWeight.w800,
  );
}
