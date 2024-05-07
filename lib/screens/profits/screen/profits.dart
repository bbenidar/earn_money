import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/route/routes.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, dynamic>> tasks = [
  <String, dynamic>{
    'title': 'Ultimate Buy',
    'subTitle': 'December 2, 2018',
    'money': 130,
    'tag': 'Survey'
  },
  <String, dynamic>{
    'title': 'Daily Check in',
    'subTitle': 'December 2, 2018',
    'money': 24,
    'tag': 'Task'
  },
  <String, dynamic>{
    'title': 'Registration',
    'subTitle': 'Install and play 1 mins',
    'money': 68,
    'tag': 'App'
  },
  <String, dynamic>{
    'title': 'Refer Friends',
    'subTitle': 'Purchase this package',
    'money': 79,
    'tag': 'Review'
  },
  <String, dynamic>{
    'title': 'Ultimate Buy',
    'subTitle': 'Purchase this package',
    'money': 130,
    'tag': 'Task'
  },
  <String, dynamic>{
    'title': 'Demographic',
    'subTitle': 'Consumers cognitive demo',
    'money': 24,
    'tag': 'Survey'
  },
  <String, dynamic>{
    'title': 'Game App',
    'subTitle': 'Install and play 1 mins',
    'money': 68,
    'tag': 'Survey'
  },
  <String, dynamic>{
    'title': 'Monster Pack',
    'subTitle': 'Purchase this package',
    'money': 79,
    'tag': 'Task'
  },
];

class Profits extends StatefulWidget {
  const Profits({super.key});

  @override
  State<Profits> createState() => _ProfitsState();
}

class _ProfitsState extends State<Profits> {
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
          AnimationClick(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(wallet_card),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Balance',
                    style: body(color: grey1100.withOpacity(0.5)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '13,579.00 P',
                    style: title1(color: grey1100),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Today',
                              style: body(color: grey1100.withOpacity(0.5)),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '79.00 P',
                              style: title4(color: grey1100),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 48,
                        decoration: BoxDecoration(
                            color: grey1100.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'This weeks',
                              style: body(color: grey1100.withOpacity(0.5)),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '286.00 P',
                              style: title4(color: grey1100),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 32),
            child: GradientText(
              'History',
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
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            itemCount: tasks.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemBuilder: (context, index) => AnimationClick(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                                  style: caption1(color: grey1100),
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
                            color: green),
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
