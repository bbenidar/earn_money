import 'package:flutter/material.dart';
import 'package:flutter_taearn/common/constant/images.dart';
import 'package:flutter_taearn/common/constant/styles.dart';

import '../../../common/constant/colors.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, dynamic>> notifications = [
  <String, dynamic>{
    'title': 'Complete Survey',
    'description': 'You have fill all awnser of survey “Ultimate Mobile App"',
    'subTitle': '15 May 2020 10:00 pm',
    'icon': book,
    'bg': green
  },
  <String, dynamic>{
    'title': 'Send Request Cash Out Money',
    'description': 'You have request redeem 50.000 Points to 500 Paypal',
    'subTitle': '15 May 2020 10:00 pm',
    'icon': money,
    'bg': primary
  },
  <String, dynamic>{
    'title': 'Complete Survey',
    'description': 'You have fill all awnser of survey “Ultimate Mobile App"',
    'subTitle': '15 May 2020 10:00 pm',
    'icon': book,
    'bg': green
  },
  <String, dynamic>{
    'title': 'Send Request Cash Out Money',
    'description': 'You have request redeem 50.000 Points to 500 Paypal',
    'subTitle': '15 May 2020 10:00 pm',
    'icon': money,
    'bg': primary
  },
  <String, dynamic>{
    'title': 'Complete Survey',
    'description': 'You have fill all awnser of survey “Ultimate Mobile App"',
    'subTitle': '15 May 2020 10:00 pm',
    'icon': book,
    'bg': green
  },
  <String, dynamic>{
    'title': 'Complete Survey',
    'description': 'You have fill all awnser of survey “Ultimate Mobile App"',
    'subTitle': '15 May 2020 10:00 pm',
    'icon': book,
    'bg': green
  },
  <String, dynamic>{
    'title': 'Send Request Cash Out Money',
    'description': 'You have request redeem 50.000 Points to 500 Paypal',
    'subTitle': '15 May 2020 10:00 pm',
    'icon': money,
    'bg': primary
  },
  <String, dynamic>{
    'title': 'Complete Survey',
    'description': 'You have fill all awnser of survey “Ultimate Mobile App"',
    'subTitle': '15 May 2020 10:00 pm',
    'icon': book,
    'bg': green
  },
];

class ListNotification extends StatelessWidget {
  const ListNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarCpn(
          left: AnimationClick(
            function: () {
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                Icons.close,
                size: 28,
                color: grey1100,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: GradientText(
                'Notifications',
                style: const TextStyle(
                    fontSize: 48,
                    height: 1,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SpaceGrotesk'),
                gradient: LinearGradient(colors: [
                  const Color(0xFFCFE1FD).withOpacity(0.9),
                  const Color(0xFFFFFDE1).withOpacity(0.9),
                ]),
              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemCount: notifications.length,
                separatorBuilder: (context, index) => const SizedBox(height: 4),
                itemBuilder: (context, index) => AnimationClick(
                  child: Opacity(
                    opacity: index >= 4 ? 0.3 : 1,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: grey200,
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: notifications[index]['bg'],
                                borderRadius: BorderRadius.circular(16)),
                            child: Image.asset(
                              notifications[index]['icon']!,
                              width: 28,
                              height: 28,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GradientText(
                                  notifications[index]['title']!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      height: 1,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'SpaceGrotesk'),
                                  gradient: LinearGradient(colors: [
                                    const Color(0xFFCFE1FD).withOpacity(0.9),
                                    const Color(0xFFFFFDE1).withOpacity(0.9),
                                  ]),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    notifications[index]['description']!,
                                    style: subhead(color: grey800),
                                  ),
                                ),
                                Text(
                                  notifications[index]['subTitle']!,
                                  style: footnote(color: grey500),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
