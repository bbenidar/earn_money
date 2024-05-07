import 'package:flutter/material.dart';
import 'package:flutter_taearn/common/route/routes.dart';
import 'package:flutter_taearn/screens/payout/screen/detail_payout.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/payout_widget.dart';

class Payout extends StatefulWidget {
  const Payout({super.key});

  @override
  State<Payout> createState() => _PayoutState();
}

class _PayoutState extends State<Payout> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _currentIndex = 0;
  List<Map<String, dynamic>> itemsPayout = [
    <String, dynamic>{
      'icon': icon_p,
      'money': 500,
      'subTitle': '50.000 Points',
      'status': 'Pending'
    },
    <String, dynamic>{
      'icon': icon_p,
      'money': 1000,
      'subTitle': '100.000 Credits',
      'status': 'Pending'
    },
    <String, dynamic>{
      'icon': icon_p,
      'money': 1500,
      'subTitle': '150.000 Points',
      'status': 'Pending'
    },
    <String, dynamic>{
      'icon': icon_p,
      'money': 500,
      'subTitle': '50.000 Points',
      'status': 'Pending'
    },
  ];
  List<Map<String, dynamic>> itemsHistory = [];
  int count = 0;

  Widget itemView(List<Map<String, dynamic>> items, {bool isHistory = false}) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 24),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 4),
      itemBuilder: (context, index) {
        final String status = items[index]['status'];
        return AnimationClick(
          function: () {
            if (isHistory) {
              Navigator.of(context).pushNamed(Routes.detailPayout,
                  arguments: DetailPayout(item: items[index]));
            }
          },
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(24)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            items[index]['icon']!,
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '\$${items[index]['money']!}',
                              style: title3(color: grey1100),
                            ),
                          )
                        ],
                      ),
                    ),
                    if (isHistory) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                            color: status == 'Done'
                                ? primary
                                : status == 'Waiting'
                                    ? corn1
                                    : radicalRed1,
                            borderRadius: BorderRadius.circular(16)),
                        child: status == 'Done'
                            ? done()
                            : status == 'Waiting'
                                ? waiting()
                                : failed(),
                      )
                    ]
                  ],
                ),
                AppWidget.divider(context,
                    vertical: 16, color: grey300.withOpacity(0.3)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${items[index]['subTitle']}',
                      style: body(color: grey1100),
                    ),
                    if (isHistory) ...[
                      Text(
                        'use 20 Jun 2023',
                        style: body(color: corn1),
                      ),
                    ] else ...[
                      AnimationClick(
                        function: () {
                          setState(() {
                            if (count == 1) {
                              items[index]['status'] = 'Waiting';
                            } else if (count == 2) {
                              items[index]['status'] = 'Failed';
                            } else {
                              items[index]['status'] = 'Done';
                            }
                            itemsHistory.add(items[index]);
                            items.remove(items[index]);
                            count++;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: primary),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Text(
                            'Payout',
                            style: headline(color: grey1100),
                          ),
                        ),
                      )
                    ]
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    _controller =
        TabController(length: 2, vsync: this, initialIndex: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarCpn(
          left: AnimationClick(
            function: () {
              Navigator.of(context).pushNamed(Routes.notification);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Image.asset(
                bellRinging,
                width: 24,
                height: 24,
                color: grey1100,
              ),
            ),
          ),
          right: _currentIndex == 1
              ? AnimationClick(
                  function: () {
                    Navigator.of(context).pushNamed(Routes.setAccount);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24), color: green),
                    child: Text(
                      'Set Account',
                      style: subhead(color: grey1100, fontWeight: '700'),
                    ),
                  ),
                )
              : AnimationClick(
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: GradientText(
              'Payout',
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
          Container(
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: grey200,
                border: Border.all(color: grey300)),
            child: TabBar(
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              controller: _controller,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: primary,
              ),
              labelStyle: footnote(color: grey1100),
              unselectedLabelStyle: footnote(color: grey1100),
              labelColor: grey1100,
              unselectedLabelColor: grey1100,
              indicatorColor: primary,
              indicatorPadding: const EdgeInsets.all(2),
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
              tabs: const [
                Tab(text: 'Payout'),
                Tab(text: 'History'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: _controller, children: [
              itemsPayout.isEmpty
                  ? empty(isPayout: true)
                  : itemView(itemsPayout),
              itemsHistory.isEmpty
                  ? empty()
                  : itemView(itemsHistory, isHistory: true),
            ]),
          )
        ],
      ),
    );
  }
}
