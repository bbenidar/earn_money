import 'package:flutter/material.dart';
import 'package:flutter_taearn/common/widget/app_bar_cpn.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/progress_bar.dart';

List<Map<String, dynamic>> items = [
  <String, dynamic>{
    'title': 'Play game 180 minutes',
    'icon': achievement1,
    'level': '02',
    'bg': const Color(0xFF00CD50),
    'doneClaim': false,
    'actual': 500,
    'pland': 500
  },
  <String, dynamic>{
    'title': 'Use 100 spells',
    'icon': achievement2,
    'level': '02',
    'bg': stPatricksBlue,
    'doneClaim': false,
    'actual': 100,
    'pland': 500
  },
  <String, dynamic>{
    'title': 'Get 10,000 Gold',
    'icon': achievement3,
    'level': '02',
    'bg': emerald1,
    'doneClaim': true,
    'actual': 500,
    'pland': 500
  },
  <String, dynamic>{
    'title': 'Up tier 3',
    'icon': achievement4,
    'level': '02',
    'bg': lightSalmon,
    'doneClaim': false,
    'actual': 300,
    'pland': 500
  },
  <String, dynamic>{
    'title': 'Use 100 spells',
    'icon': achievement1,
    'level': '02',
    'bg': stPatricksBlue,
    'doneClaim': false,
    'actual': 0,
    'pland': 500
  },
];

class Achievements extends StatelessWidget {
  const Achievements({super.key});

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
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
          center: Text(
            'Achievements',
            style: headline(color: grey1100),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: green, borderRadius: BorderRadius.circular(16)),
                child: Image.asset(
                  sketchLogo,
                  width: 28,
                  height: 28,
                  color: grey1100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 4),
                child: Text(
                  'Level 3',
                  style: title2(color: grey1100),
                ),
              ),
              Text(
                '150/180 Exp',
                style: subhead(color: grey800),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16, left: 16),
            child: GradientText(
              '6/108 Done',
              style: const TextStyle(
                  fontSize: 28,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SpaceGrotesk'),
              gradient: LinearGradient(colors: [
                const Color(0xFFCFE1FD).withOpacity(0.9),
                const Color(0xFFFFFDE1).withOpacity(0.9),
              ]),
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, index) {
                return AnimationClick(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: grey200),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: items[index]['bg']),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(items[index]['icon'],
                                  width: 40, height: 40),
                              const SizedBox(height: 16),
                              Text(
                                'Lvl ${items[index]['level']}',
                                style: headline(color: grey1100),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              GradientText(
                                items[index]['title'],
                                style: const TextStyle(
                                    fontSize: 20,
                                    height: 1.5,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'SpaceGrotesk'),
                                gradient: LinearGradient(colors: [
                                  const Color(0xFFCFE1FD).withOpacity(0.9),
                                  const Color(0xFFFFFDE1).withOpacity(0.9),
                                ]),
                              ),
                              if (items[index]['actual'] ==
                                      items[index]['pland'] &&
                                  !items[index]['doneClaim']) ...[
                                const SizedBox(height: 20),
                                AppWidget.typeButtonStartAction(
                                    context: context,
                                    input: 'Claim 200 Points',
                                    bgColor: primary,
                                    borderColor: primary,
                                    textColor: grey1100,
                                    borderRadius: 16,
                                    onPressed: () {})
                              ] else if (items[index]['actual'] ==
                                      items[index]['pland'] &&
                                  items[index]['doneClaim']) ...[
                                const SizedBox(height: 20),
                                AppWidget.typeButtonStartAction(
                                    context: context,
                                    input: 'Claimed',
                                    bgColor: grey300,
                                    borderColor: grey300,
                                    textColor: grey1100.withOpacity(0.24),
                                    borderRadius: 16,
                                    onPressed: () {})
                              ] else if (items[index]['actual'] !=
                                  items[index]['pland']) ...[
                                const SizedBox(height: 24),
                                Column(
                                  children: [
                                    ProgressBar(
                                        width: width *
                                            items[index]['actual'] /
                                            items[index]['pland']),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          items[index]['actual'].toString(),
                                          style: subhead(color: grey1100),
                                        ),
                                        Text(
                                          items[index]['pland'].toString(),
                                          style: subhead(color: grey500),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ]
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemCount: items.length)
        ],
      ),
    );
  }
}
