import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/constant/colors.dart';
import '../common/constant/images.dart';
import '../common/constant/styles.dart';
import '../common/widget/animation_click.dart';

mixin AppWidget {
  static double getHeightScreen(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidthScreen(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Future<void> showLoading({required BuildContext context}) async {
    showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      barrierColor: grey900,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: const CupertinoActivityIndicator(
              animating: true,
            ));
      },
    );
  }

  static Future<void> showDialogCustom(String title,
      {required BuildContext context, Function()? remove}) async {
    showDialog<dynamic>(
      context: context,
      builder: (context) {
        final height = AppWidget.getHeightScreen(context);
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: grey1100,
          child: Container(
            padding: const EdgeInsets.all(30),
            height: height / 116 * 56,
            child: Column(
              children: [
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: headline(context: context),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppWidget.typeButtonStartAction(
                          context: context,
                          input: 'Yes',
                          bgColor: emerald1,
                          textColor: grey1100,
                          borderRadius: 48,
                          onPressed: () {
                            remove!();
                          }),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48),
                            ),
                            side: const BorderSide(color: emerald1)),
                        child: Text('No',
                            textAlign: TextAlign.center,
                            style: headline(color: emerald1)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static PreferredSizeWidget createSimpleAppBar(
      {required BuildContext context,
      bool hasPop = true,
      Color? backgroundColor,
      bool hasLeading = true,
      String? title,
      Widget? action,
      Color? colorTitle,
      Color? arrowColor,
      Function()? onTap,
      Function()? onBack}) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor ?? grey100,
      leading: hasLeading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimationClick(
                  child: GestureDetector(
                      onTap: () {
                        if (hasPop) {
                          if (onBack != null) {
                            onBack();
                          } else {
                            Navigator.of(context).pop();
                          }
                        }
                      },
                      child: Image.asset(
                        icArrowLeft,
                        color: grey1100,
                        width: 24,
                        height: 24,
                      )),
                ),
              ],
            )
          : const SizedBox(),
      centerTitle: true,
      title: title == null
          ? null
          : Text(
              title,
              style: colorTitle == null
                  ? headline(context: context, fontWeight: '700')
                  : headline(color: colorTitle, fontWeight: '700'),
            ),
      actions: [
        onTap != null
            ? Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: onTap,
                        icon: action ??
                            const Icon(
                              Icons.add,
                              color: grey1100,
                              size: 24,
                            ))
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }

  static Widget typeButtonStartAction(
      {double? fontSize,
      required BuildContext context,
      double? height,
      double? vertical,
      double? horizontal,
      Function()? onPressed,
      Color? bgColor,
      Color? borderColor,
      double miniSizeHorizontal = double.infinity,
      Color? textColor,
      String? input,
      FontWeight? fontWeight,
      double borderRadius = 32,
      double sizeAsset = 16,
      Color? colorAsset,
      String? icon}) {
    return AnimationClick(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
              vertical: vertical ?? 18, horizontal: horizontal ?? 0),
          side: BorderSide(color: borderColor ?? grey1100),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          backgroundColor: bgColor,
          minimumSize: Size(miniSizeHorizontal, 0),
        ),
        onPressed: onPressed,
        child: icon == null
            ? Text(
                input!,
                textAlign: TextAlign.center,
                style: headline(context: context, color: textColor),
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        input!,
                        textAlign: TextAlign.center,
                        style: headline(context: context, color: textColor),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                          child: Image.asset(
                        icon,
                        width: sizeAsset,
                        height: sizeAsset,
                        color: colorAsset,
                      )),
                    ],
                  );
                },
              ),
      ),
    );
  }

  static Widget typeButtonStartAction2(
      {double? fontSize,
      required BuildContext context,
      double? height,
      double? vertical,
      double? horizontal,
      Function()? onPressed,
      Color? bgColor,
      Color? borderColor,
      double miniSizeHorizontal = double.infinity,
      Color? textColor,
      String? input,
      FontWeight? fontWeight,
      double borderRadius = 32,
      double sizeAsset = 16,
      Color? colorAsset,
      String? icon}) {
    return AnimationClick(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
              vertical: vertical ?? 18, horizontal: horizontal ?? 0),
          side: BorderSide(color: borderColor ?? grey1100),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          backgroundColor: bgColor,
          minimumSize: Size(miniSizeHorizontal, 0),
        ),
        onPressed: onPressed,
        child: icon == null
            ? Text(
                input!,
                textAlign: TextAlign.center,
                style: headline(context: context, color: textColor),
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          child: Image.asset(
                        icon,
                        width: sizeAsset,
                        height: sizeAsset,
                        color: colorAsset,
                      )),
                      const SizedBox(width: 8),
                      Text(
                        input!,
                        textAlign: TextAlign.center,
                        style: headline(context: context, color: textColor),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }

  static SnackBar customSnackBar(
      {required String content, Color? color, int? milliseconds}) {
    return SnackBar(
      duration: Duration(milliseconds: milliseconds ?? 600),
      backgroundColor: color ?? emerald1,
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: body(color: grey1100),
      ),
    );
  }

  static Widget divider(BuildContext context,
      {double vertical = 24, Color color = grey600}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical),
      child: Divider(
        thickness: 1,
        color: color,
      ),
    );
  }

  static BottomNavigationBarItem createItemNav(BuildContext context,
      String iconInactive, String iconActive, String label,
      {bool hasIntro = false,
      Color iconColor = grey1100,
      bool hasContainer = false}) {
    return BottomNavigationBarItem(
        activeIcon: hasContainer
            ? Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(24)),
                child: Image.asset(
                  iconActive,
                  width: 24,
                  height: 24,
                  color: corn1,
                  fit: BoxFit.cover,
                ),
              )
            : Column(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                        color: corn1, borderRadius: BorderRadius.circular(24)),
                  ),
                  Image.asset(
                    iconActive,
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
        icon: Image.asset(
          iconInactive,
          width: 24,
          height: 24,
          fit: BoxFit.cover,
        ),
        label: label);
  }

  static BottomNavigationBarItem createItemNav2(BuildContext context,
      String iconInactive, String iconActive, String label,
      {bool hasIntro = false, Color iconColor = grey1100}) {
    return BottomNavigationBarItem(
        activeIcon: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 4,
              width: 4,
              margin: const EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                  color: grey1100, borderRadius: BorderRadius.circular(24)),
            ),
            Image.asset(
              iconActive,
              width: 24,
              height: 24,
              color: grey1100,
              fit: BoxFit.cover,
            )
          ],
        ),
        icon: Image.asset(
          iconInactive,
          width: 24,
          height: 24,
          color: grey600,
          fit: BoxFit.cover,
        ),
        label: label);
  }
}
