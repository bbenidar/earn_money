import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taearn/common/route/routes.dart';
import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';

import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';

List<Map<String, dynamic>> generals = [
  <String, dynamic>{
    'title': 'Notification',
    'subTitle': 'Open all',
    'icon': bellRinging,
    'bgColor': primary,
    'onTap': () {}
  },
  <String, dynamic>{
    'title': 'Achivements',
    'subTitle': 'Level 3',
    'icon': sketchLogo,
    'bgColor': green,
    'onTap': () {}
  },
];

List<Map<String, dynamic>> supports = [
  <String, dynamic>{
    'title': 'How to work',
    'icon': clipboardText,
    'bgColor': stPatricksBlue,
    'onTap': () {}
  },
  <String, dynamic>{
    'title': 'Privacy Policy',
    'icon': lockOpen,
    'bgColor': emerald1,
    'onTap': () {}
  },
  <String, dynamic>{
    'title': 'Terms & Conditions',
    'icon': book,
    'bgColor': lightSalmon,
    'onTap': () {}
  },
];

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool themeMode = true;

  Widget item(String title, Color bgColor, String image,
      {String? subTitle, bool isSwitch = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: grey200, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(16)),
            child: Image.asset(image, width: 28, height: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: headline(color: grey1100),
                ),
                if (subTitle != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    subTitle,
                    style: subhead(color: grey800),
                  )
                ]
              ],
            ),
          ),
          if (isSwitch) ...[
            CupertinoSwitch(
                activeColor: primary,
                value: themeMode,
                onChanged: (value) async {
                  setState(() {
                    themeMode = !themeMode;
                  });
                })
          ] else ...[
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 32,
              color: grey500,
            )
          ]
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
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
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              const AnimationClick(
                child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      avtFemale,
                    )),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Albert Flores',
                          style: title3(color: grey1100),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(checkbox, width: 24, height: 24)
                      ],
                    ),
                  ),
                  AnimationClick(
                    function: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(colors: [
                          const Color(0xFFCFE1FD).withOpacity(0.9),
                          const Color(0xFFFFFDE1).withOpacity(0.9),
                        ]),
                      ),
                      child: Text(
                        '3,000 P',
                        style: subhead(color: grey100, fontWeight: '600'),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Image.asset(giphy, width: 32, height: 32),
                ),
                Text(
                  'Gerenal'.toUpperCase(),
                  style: title4(color: grey1100),
                )
              ],
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 24),
              itemBuilder: (context, index) => AnimationClick(
                    function: () {
                      if (index == 1) {
                        Navigator.of(context).pushNamed(Routes.achievements);
                      }
                    },
                    child: item(generals[index]['title'],
                        generals[index]['bgColor'], generals[index]['icon'],
                        subTitle: generals[index]['subTitle'],
                        isSwitch: index == 0),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: generals.length),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Image.asset(giphy, width: 32, height: 32),
                ),
                Text(
                  'Support'.toUpperCase(),
                  style: title4(color: grey1100),
                )
              ],
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => AnimationClick(
                    function: () {
                      if (index == 0) {
                        Navigator.of(context).pushNamed(Routes.howToWork);
                      }
                    },
                    child: item(
                      supports[index]['title'],
                      supports[index]['bgColor'],
                      supports[index]['icon'],
                      subTitle: supports[index]['subTitle'],
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: supports.length),
          const SizedBox(height: 24),
          AppWidget.typeButtonStartAction2(
              context: context,
              input: 'Sign Out',
              bgColor: grey200,
              icon: signOut,
              textColor: grey1100,
              borderColor: grey200,
              sizeAsset: 24,
              borderRadius: 16,
              onPressed: () {}),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimationClick(
                child: Text(
                  'Delete Account',
                  style: headline(color: radicalRed1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  'Version 202303',
                  style: footnote(color: grey600),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
