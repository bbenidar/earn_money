import 'package:flutter/material.dart';
import '../../../common/constant/colors.dart';

FontWeight checkWeight(String weight) {
  switch (weight) {
    case '500':
      return FontWeight.w500;
    case '600':
      return FontWeight.w600;
    case '700':
      return FontWeight.w700;
    default:
      return FontWeight.w400;
  }
}

TextStyle grotesk(double fontSize, double height,
    {BuildContext? context,
    String fontWeight = '400',
    Color? color,
    String? fontFamily,
    double? letterSpacing,
    bool hasUnderLine = false}) {
  return TextStyle(
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      height: height / fontSize,
      color: color ?? Theme.of(context!).color11,
      fontWeight: checkWeight(fontWeight),
      decoration: hasUnderLine ? TextDecoration.underline : TextDecoration.none,
      fontFamily: fontFamily ?? 'Inter');
}

TextStyle header(
    {BuildContext? context,
    String fontWeight = '700',
    bool hasUnderLine = false,
    String fontFamily = 'Inter',
    double? letterSpacing,
    Color? color}) {
  return grotesk(38, 44,
      context: context,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      hasUnderLine: hasUnderLine,
      fontFamily: fontFamily,
      color: color);
}

TextStyle title1(
    {BuildContext? context,
    String fontWeight = '700',
    bool hasUnderLine = false,
    String fontFamily = 'Inter',
    double? letterSpacing,
    Color? color}) {
  return grotesk(32, 40,
      context: context,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      hasUnderLine: hasUnderLine,
      fontFamily: fontFamily,
      color: color);
}

TextStyle title2(
    {BuildContext? context,
    String fontWeight = '700',
    bool hasUnderLine = false,
    String fontFamily = 'Inter',
    double? letterSpacing,
    Color? color}) {
  return grotesk(29, 40,
      context: context,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      hasUnderLine: hasUnderLine,
      fontFamily: fontFamily,
      color: color);
}

TextStyle title3(
    {BuildContext? context,
    String fontWeight = '700',
    bool hasUnderLine = false,
    String fontFamily = 'Inter',
    double? letterSpacing,
    Color? color}) {
  return grotesk(25, 30,
      context: context,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      hasUnderLine: hasUnderLine,
      fontFamily: fontFamily,
      color: color);
}

TextStyle title4(
    {BuildContext? context,
    String fontWeight = '700',
    bool hasUnderLine = false,
    String fontFamily = 'Inter',
    double? letterSpacing,
    Color? color}) {
  return grotesk(19, 24,
      context: context,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      hasUnderLine: hasUnderLine,
      fontFamily: fontFamily,
      color: color);
}

TextStyle headline(
    {BuildContext? context,
    String fontWeight = '700',
    bool hasUnderLine = false,
    String fontFamily = 'Inter',
    double? letterSpacing,
    Color? color}) {
  return grotesk(17, 22,
      context: context,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      hasUnderLine: hasUnderLine,
      fontFamily: fontFamily,
      color: color);
}

TextStyle body(
    {BuildContext? context,
    String fontWeight = '400',
    bool hasUnderLine = false,
    String fontFamily = 'Inter',
    double? letterSpacing,
    Color? color}) {
  return grotesk(18, 24,
      context: context,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      hasUnderLine: hasUnderLine,
      fontFamily: fontFamily,
      color: color);
}

TextStyle callout(
    {BuildContext? context,
    String fontWeight = '600',
    bool hasUnderLine = false,
    String fontFamily = 'Inter',
    double? letterSpacing,
    Color? color}) {
  return grotesk(17, 24,
      context: context,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      hasUnderLine: hasUnderLine,
      fontFamily: fontFamily,
      color: color);
}

TextStyle subhead(
    {BuildContext? context,
    String fontWeight = '500',
    bool hasUnderLine = false,
    String fontFamily = 'Inter',
    double? letterSpacing,
    Color? color}) {
  return grotesk(15, 20,
      context: context,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      hasUnderLine: hasUnderLine,
      fontFamily: fontFamily,
      color: color);
}

TextStyle footnote(
    {BuildContext? context,
    String fontWeight = '400',
    bool hasUnderLine = false,
    String fontFamily = 'Inter',
    double? letterSpacing,
    Color? color}) {
  return grotesk(14, 18,
      context: context,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      hasUnderLine: hasUnderLine,
      fontFamily: fontFamily,
      color: color);
}

TextStyle caption1(
    {BuildContext? context,
    String fontWeight = '400',
    bool hasUnderLine = false,
    String fontFamily = 'Inter',
    double? letterSpacing,
    Color? color}) {
  return grotesk(13, 16,
      context: context,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      hasUnderLine: hasUnderLine,
      fontFamily: fontFamily,
      color: color);
}

TextStyle caption2(
    {BuildContext? context,
    String fontWeight = '400',
    bool hasUnderLine = false,
    String fontFamily = 'Inter',
    double? letterSpacing,
    Color? color}) {
  return grotesk(11, 13,
      context: context,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      hasUnderLine: hasUnderLine,
      fontFamily: fontFamily,
      color: color);
}
