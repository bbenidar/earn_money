import 'package:flutter/material.dart';
import '../../../common/constant/colors.dart';

mixin OnBoardingWidget {
  static Widget createIndicator({int? currentImage, int? lengthImage}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(lengthImage!, (index) {
          return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: index == currentImage ? 6 : 6,
              width: index == currentImage ? 30 : 6,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  color: index == currentImage ? grey1100 : grey400));
        }));
  }
}
