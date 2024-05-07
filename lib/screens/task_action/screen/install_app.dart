import 'package:flutter/material.dart';
import 'package:flutter_taearn/common/constant/images.dart';
import 'package:flutter_taearn/common/constant/styles.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/route/routes.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../home/screen/home.dart';

List<String> steps = [
  'Click Install App “Task to earn”',
  'Walkthroughs app “Task to earn” in 30s - 1mins',
  'Back to this app and earn points'
];

class InstallApp extends StatelessWidget {
  const InstallApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
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
                    borderRadius: BorderRadius.circular(32)),
                child: const Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 32,
                  color: grey1100,
                ),
              )),
          right: AnimationClick(
            child: Container(
              margin: const EdgeInsets.only(right: 24),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: primary),
              child: Text(
                '+130 P',
                style: subhead(color: grey1100, fontWeight: '700'),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: AppWidget.typeButtonStartAction2(
            context: context,
            input: 'Install App',
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
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: height / 5,
                  width: width,
                  decoration: BoxDecoration(
                    color: grey200,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Image.asset(
                    installApp,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: -64,
                  left: 24,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: grey100,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: grey200, width: 2)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            logo,
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Task to earn',
                            style: title4(color: grey1100),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Money app',
                            style: footnote(color: grey600),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ]),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
            itemCount: steps.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: 19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 4,
                      width: 1,
                      color: grey1100.withOpacity(0.5),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 4,
                      width: 1,
                      color: grey1100.withOpacity(0.5),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 4,
                      width: 1,
                      color: grey1100.withOpacity(0.5),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 4,
                      width: 1,
                      color: grey1100.withOpacity(0.5),
                    )
                  ],
                ),
              ),
            ),
            itemBuilder: (context, index) => Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
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
