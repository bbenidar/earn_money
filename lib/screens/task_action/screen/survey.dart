import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../popup_success/screen/popup_success.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  List<Map<String, dynamic>> questions = [];
  int currentQuestion = 1;
  @override
  void initState() {
    questions = List.generate(
      10,
      (index) => <String, dynamic>{
        'question': 'Does Kalshi have pattern day-trading restrictions?',
        'answers': [
          {
            'answer':
                'Lay the groundwork to make the quarterly analysis process more efficient',
            'selected': false
          },
          {
            'answer': 'Improve budgeting transparency and update speed',
            'selected': false
          },
          {
            'answer':
                'Improve the way we manage expenses reporting to find opportunities to increase profitability',
            'selected': false
          },
          {
            'answer': '1000screen, darkmode, template, ui, kit',
            'selected': false
          }
        ],
        'is_done': false
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppWidget.typeButtonStartAction(
              context: context,
              input: 'Previous',
              bgColor: const Color(0xFF3E517A),
              borderColor: const Color(0xFF3E517A),
              onPressed: () {
                if (currentQuestion <= 1) {
                  return;
                }
                setState(() {
                  currentQuestion -= 1;
                });
              },
              textColor: grey1100,
              borderRadius: 32,
            ),
            const SizedBox(height: 16),
            AppWidget.typeButtonStartAction(
              context: context,
              input: 'Next',
              bgColor: green,
              borderColor: green,
              onPressed: currentQuestion >= questions.length - 1
                  ? () {
                      Navigator.of(context)
                          .pushReplacement<void, void>(PopupSuccess());
                    }
                  : () {
                      bool checkSelected = false;
                      final List<Map<String, dynamic>> answers =
                          questions[currentQuestion]['answers'];
                      for (var e in answers) {
                        if (e['selected']) {
                          checkSelected = true;
                        }
                      }
                      if (!checkSelected) {
                        return;
                      }
                      setState(() {
                        questions[currentQuestion]['is_done'] = true;
                        currentQuestion += 1;
                      });
                    },
              textColor: grey1100,
              borderRadius: 32,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          AnimationClick(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: grey200, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        icTaskEarn2,
                        width: 56,
                        height: 56,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  color: grey300,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Text(
                                'Survey',
                                style: caption1(color: grey1100),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Demographic Smoke Survey',
                              style: headline(color: grey1100),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Consumers cognitive demo',
                              style: caption1(color: grey600),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 8,
                            width: width,
                            decoration: BoxDecoration(
                                color: grey300,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: 8,
                            width: width *
                                (currentQuestion - 1) /
                                questions.length,
                            curve: Curves.linearToEaseOut,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(16)),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$currentQuestion',
                            style: subhead(color: grey1100),
                          ),
                          Text(
                            '${questions.length}',
                            style: subhead(color: grey500),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Does Kalshi have pattern day-trading restrictions?',
                    style: title4(color: grey1100),
                  )
                ],
              ),
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final bool selected =
                    questions[currentQuestion]['answers'][index]['selected'];
                final String answer =
                    questions[currentQuestion]['answers'][index]['answer'];
                return AnimationClick(
                    function: () {
                      setState(() {
                        for (var a in questions[currentQuestion]['answers']) {
                          a['selected'] = false;
                        }
                        questions[currentQuestion]['answers'][index]
                            ['selected'] = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: grey200,
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        children: [
                          selected
                              ? Image.asset(checkCircleActive,
                                  width: 28, height: 28)
                              : const Icon(
                                  Icons.circle_outlined,
                                  size: 28,
                                  color: grey400,
                                ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              answer,
                              style: callout(
                                  color: selected ? grey1100 : grey800,
                                  fontWeight: '400'),
                            ),
                          )
                        ],
                      ),
                    ));
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: questions[currentQuestion]['answers'].length)
        ],
      ),
    );
  }
}
