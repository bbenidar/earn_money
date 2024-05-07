import 'package:flutter/material.dart';
import 'package:flutter_taearn/common/route/routes.dart';
import 'package:flutter_taearn/common/widget/gradient_text.dart';
import 'package:flutter_taearn/screens/home/screen/home.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';

class PopupSuccess extends PageRouteBuilder<dynamic> {
  PopupSuccess()
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                const Scaffold());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SlideTransition(
      position:
          Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0.0, 0.0))
              .animate(controller!),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              Expanded(flex: 3, child: Image.asset(success)),
              const GradientText(
                'Done!',
                style: TextStyle(
                    fontSize: 40,
                    height: 1,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SpaceGrotesk'),
                gradient: LinearGradient(colors: [
                  Color(0xFFCFE1FD),
                  Color(0xFFFFFDE1),
                ]),
              ),
              // Text(
              //   'Done!',
              //   textAlign: TextAlign.center,
              //   style: header(color: grey1100),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'You have sent survey.',
                  textAlign: TextAlign.center,
                  style: body(color: grey700),
                ),
              ),
              AnimationClick(
                function: () {
                  Navigator.of(context).pushNamed(Routes.home,
                      arguments: const Home(currentIndex: 0));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(24)),
                  child: Text(
                    '+130 Points',
                    style: body(color: grey1100, fontWeight: '700'),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: AppWidget.typeButtonStartAction2(
                    context: context,
                    input: 'Take other task',
                    borderColor: green,
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(Routes.home,
                          arguments: const Home(
                            currentIndex: 0,
                          ));
                    },
                    icon: checkbox2,
                    sizeAsset: 24,
                    bgColor: green,
                    textColor: grey1100),
              ),
              const SizedBox(height: 8),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: AppWidget.typeButtonStartAction2(
                    context: context,
                    input: 'Back to Home',
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.home,
                          arguments: const Home(currentIndex: 0));
                    },
                    borderColor: primary,
                    bgColor: primary,
                    textColor: grey1100),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
