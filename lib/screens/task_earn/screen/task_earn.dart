import 'package:flutter/material.dart';
import 'package:flutter_taearn/common/route/routes.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, dynamic>> tasks = [
  <String, dynamic>{
    'icon': icTaskEarn1,
    'title': 'Ultimate Buy',
    'subTitle': 'Purchase this package',
    'money': 130,
    'tag': 'Task'
  },
  <String, dynamic>{
    'icon': icTaskEarn2,
    'title': 'Demographic',
    'subTitle': 'Consumers cognitive demo',
    'money': 24,
    'tag': 'Survey'
  },
  <String, dynamic>{
    'icon': icTaskEarn3,
    'title': 'Game App',
    'subTitle': 'Install and play 1 mins',
    'money': 68,
    'tag': '+130'
  },
  <String, dynamic>{
    'icon': icTaskEarn4,
    'title': 'Monster Pack',
    'subTitle': 'Purchase this package',
    'money': 79,
    'tag': '+130'
  },
  <String, dynamic>{
    'icon': icTaskEarn1,
    'title': 'Ultimate Buy',
    'subTitle': 'Purchase this package',
    'money': 130,
    'tag': 'Task'
  },
  <String, dynamic>{
    'icon': icTaskEarn2,
    'title': 'Demographic',
    'subTitle': 'Consumers cognitive demo',
    'money': 24,
    'tag': 'Survey'
  },
  <String, dynamic>{
    'icon': icTaskEarn3,
    'title': 'Game App',
    'subTitle': 'Install and play 1 mins',
    'money': 68,
    'tag': 'Survey'
  },
  <String, dynamic>{
    'icon': icTaskEarn4,
    'title': 'Monster Pack',
    'subTitle': 'Purchase this package',
    'money': 79,
    'tag': 'Task'
  },
];

class TaskEarn extends StatefulWidget {
  const TaskEarn({super.key});

  @override
  State<TaskEarn> createState() => _TaskEarnState();
}

class _TaskEarnState extends State<TaskEarn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarCpn(
          left: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: AnimationClick(
              function: () {
                Navigator.of(context).pushNamed(Routes.notification);
              },
              child: Image.asset(
                bellRinging,
                width: 24,
                height: 24,
              ),
            ),
          ),
          right: AnimationClick(
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ])),
              child: Text(
                '130 P',
                style: subhead(color: primary, fontWeight: '700'),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GradientText(
              'Tasks',
              style: const TextStyle(
                  fontSize: 36,
                  height: 1,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SpaceGrotesk'),
              gradient: LinearGradient(colors: [
                const Color(0xFFCFE1FD).withOpacity(0.9),
                const Color(0xFFFFFDE1).withOpacity(0.9),
              ]),
            ),
          ),
          AnimationClick(
            child: Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(24)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(shield, width: 32, height: 32),
                      const SizedBox(width: 8),
                      Expanded(
                          child: Text(
                        'Task pick today',
                        style: title3(color: grey1100),
                      ))
                    ],
                  ),
                  AppWidget.divider(context,
                      color: grey300.withOpacity(0.1), vertical: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Buy Ultimate UI KIT',
                            style: title4(color: grey1100),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '1000+ Screen iOS',
                            style: body(color: grey1100.withOpacity(0.7)),
                          ),
                        ],
                      ),
                      AnimationClick(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: stPatricksBlue),
                          child: Text(
                            '+130 P',
                            style: subhead(color: grey100, fontWeight: '700'),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: GradientText(
              'Available Tasks',
              style: const TextStyle(
                  fontSize: 28,
                  height: 1,
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            itemCount: tasks.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemBuilder: (context, index) => AnimationClick(
              function: () {
                if (index == 1) {
                  Navigator.of(context).pushNamed(Routes.survey);
                } else if (index == 2) {
                  Navigator.of(context).pushNamed(Routes.installApp);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      tasks[index]['icon'],
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                    color: grey300,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Text(
                                  tasks[index]['tag'],
                                  style: caption2(color: grey1100),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                tasks[index]['title'],
                                style: headline(color: grey1100),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            tasks[index]['subTitle'],
                            style: subhead(color: grey600, fontWeight: '400'),
                          )
                        ],
                      ),
                    ),
                    AnimationClick(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: primary),
                        child: Text(
                          '+${tasks[index]['money']} P',
                          style: subhead(color: grey1100, fontWeight: '700'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
