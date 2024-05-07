import 'package:flutter/material.dart';
import 'package:flutter_taearn/common/route/routes.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/onboarding_widget.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Map<String, String>> landings = [
    {
      'image': onboarding1,
      'title': 'Earn Points',
      'subTitle':
          'Complete as many task as you can. Each task grants you points and that are redeemable for money'
    },
    {
      'image': onboarding2,
      'title': 'Cash out',
      'subTitle':
          'Establish your own food awards and share your favourites with your '
    },
    {
      'image': onboarding3,
      'title': 'Redeemable your money',
      'subTitle':
          'Establish your own food awards and share your favourites with your '
    }
  ];
  int currentIndex = 0;
  late PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarCpn(
          center: GradientText(
            'Taearn',
            style: const TextStyle(
                fontSize: 48,
                height: 1,
                fontWeight: FontWeight.w700,
                fontFamily: 'SpaceGrotesk'),
            gradient: LinearGradient(colors: [
              const Color(0xFF60C18E).withOpacity(0.9),
              const Color(0xFFFFFDE1).withOpacity(0.9),
            ]),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          SizedBox(
            height: height / 2.3,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: landings.length,
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(32),
                  child: Image.asset(
                    landings[index]['image']!,
                    width: width,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  color: grey200, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.only(top: 24),
                      children: [
                        Text(
                          '0${currentIndex + 1}.',
                          style: header(color: corn1),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            landings[currentIndex]['title']!,
                            style: title1(color: grey1100, letterSpacing: 1),
                          ),
                        ),
                        Text(landings[currentIndex]['subTitle']!,
                            style: const TextStyle(
                                fontSize: 19, height: 24 / 16, color: grey800))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: currentIndex != landings.length - 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OnBoardingWidget.createIndicator(
                                  lengthImage: landings.length,
                                  currentImage: currentIndex),
                              AnimationClick(
                                child: Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: IconButton(
                                      onPressed: () {
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 400),
                                            curve: Curves.linear);
                                      },
                                      icon: Image.asset(
                                        icArrowRight,
                                        color: grey1100,
                                        width: 24,
                                        height: 24,
                                      )),
                                ),
                              )
                            ],
                          )
                        : AppWidget.typeButtonStartAction2(
                            context: context,
                            input: 'Get Starter',
                            bgColor: green,
                            onPressed: () {
                              Navigator.of(context).pushNamed(Routes.login);
                            },
                            borderColor: green,
                            textColor: grey1100),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
