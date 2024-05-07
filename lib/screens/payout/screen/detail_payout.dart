import 'package:flutter/material.dart';
import 'package:flutter_taearn/app/widget_support.dart';
import 'package:flutter_taearn/common/constant/colors.dart';
import 'package:flutter_taearn/common/constant/images.dart';
import 'package:flutter_taearn/common/constant/styles.dart';
import 'package:flutter_taearn/common/widget/animation_click.dart';

import '../../../common/route/routes.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../../home/screen/home.dart';
import '../widget/payout_widget.dart';

class DetailPayout extends StatelessWidget {
  const DetailPayout({Key? key, required this.item}) : super(key: key);
  final Map<String, dynamic> item;

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  avtFemale,
                  width: 80,
                  height: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 8),
                child: GradientText(
                  'Taearn have sent to you',
                  style: const TextStyle(
                      fontSize: 24,
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
                '${item['money']} P',
                style: title4(color: corn1),
              ),
              Text(
                'Nice to earn!',
                style: body(color: grey800),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 32),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                    color: item['status'] == 'Done'
                        ? primary
                        : item['status'] == 'Waiting'
                            ? corn1
                            : radicalRed1,
                    borderRadius: BorderRadius.circular(16)),
                child: item['status'] == 'Done'
                    ? done()
                    : item['status'] == 'Waiting'
                        ? waiting()
                        : failed(),
              ),
              Container(
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(24)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'From',
                          style: body(color: grey600),
                        ),
                        Text(
                          item['subTitle'],
                          style: body(color: grey1100),
                        ),
                      ],
                    ),
                    AppWidget.divider(context,
                        color: grey300.withOpacity(0.3), vertical: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'To PP account',
                          style: body(color: grey600),
                        ),
                        Text(
                          'name@mail.com',
                          style: body(color: grey1100),
                        ),
                      ],
                    ),
                    AppWidget.divider(context,
                        color: grey300.withOpacity(0.3), vertical: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Time',
                          style: body(color: grey600),
                        ),
                        Text(
                          '20 Jun 2023',
                          style: body(color: grey1100),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AnimationClick(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: grey200, borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            question,
                            width: 28,
                            height: 28,
                            color: grey1100,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Need help?',
                            style: headline(color: grey1100),
                          ),
                        ],
                      ),
                      Image.asset(
                        icKeyboardRight,
                        width: 24,
                        height: 24,
                        color: grey600,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
