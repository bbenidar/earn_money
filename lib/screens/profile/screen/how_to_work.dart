import 'package:flutter/material.dart';
import 'package:flutter_taearn/common/constant/colors.dart';
import 'package:flutter_taearn/common/constant/images.dart';
import 'package:flutter_taearn/common/constant/styles.dart';

import '../../../app/widget_support.dart';
import '../../../common/route/routes.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../../home/screen/home.dart';

List<String> steps = [
  'Complete as many task as you can. Each task grants you points and that are redeemable for money',
  'Earn enougn points you can cash out to money',
  'Choose amount money you can redeem with your points'
];

class HowToWork extends StatelessWidget {
  const HowToWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarCpn(
          left: AnimationClick(
            function: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF313037),
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Icon(
                Icons.keyboard_arrow_left_rounded,
                size: 32,
                color: grey1100,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: AppWidget.typeButtonStartAction2(
            context: context,
            input: 'Earn Points Now!',
            bgColor: green,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Routes.home,
                  arguments: const Home(currentIndex: 0));
            },
            borderColor: green,
            textColor: grey1100),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  howToWork,
                  width: 80,
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 24, bottom: 8, left: 24, right: 24),
                  child: GradientText(
                    'How to works for earn money',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 40,
                        height: 1,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SpaceGrotesk'),
                    gradient: LinearGradient(colors: [
                      const Color(0xFFCFE1FD).withOpacity(0.9),
                      const Color(0xFFFFFDE1).withOpacity(0.9),
                    ]),
                  ),
                ),
                Text(
                  'Get your to-do list complete',
                  textAlign: TextAlign.center,
                  style: title4(color: grey1000),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            itemCount: steps.length,
            separatorBuilder: (context, index) => const SizedBox(height: 32),
            itemBuilder: (context, index) => Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: stPatricksBlue,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: headline(color: grey1100),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    steps[index],
                    style: body(color: grey900),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
