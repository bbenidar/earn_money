import 'package:flutter/material.dart';
import 'package:flutter_taearn/common/constant/colors.dart';
import 'package:flutter_taearn/common/widget/animation_click.dart';
import 'package:flutter_taearn/common/widget/app_bar_cpn.dart';

import '../../../app/widget_support.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield.dart';

class SetAccount extends StatefulWidget {
  const SetAccount({Key? key}) : super(key: key);

  @override
  State<SetAccount> createState() => _SetAccountState();
}

class _SetAccountState extends State<SetAccount> {
  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: GradientText(
              'Your Paypal Account',
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
          TextFieldCpn(
            controller: emailCtl,
            focusNode: emailFn,
            hintText: 'name@gmail.com',
            filled: true,
            fillColor: grey200,
          ),
          const SizedBox(height: 16),
          AppWidget.typeButtonStartAction2(
              context: context,
              input: 'Update',
              bgColor: green,
              onPressed: () {
                Navigator.of(context).pop();
              },
              borderColor: green,
              textColor: grey1100)
        ],
      ),
    );
  }
}
