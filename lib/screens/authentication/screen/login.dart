import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taearn/common/route/routes.dart';
import 'package:flutter_taearn/screens/home/screen/home.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/util/authentication_google.dart';
import '../../../common/widget/gradient_text.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            height: height / 2.5,
            child: Stack(
              children: [
                Positioned(
                  top: -24,
                  left: -width / 10,
                  child: Image.asset(
                    bg3,
                    height: height / 2.2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GradientText(
                      'Taearn',
                      style: const TextStyle(
                          fontSize: 40,
                          height: 1,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SpaceGrotesk'),
                      gradient: LinearGradient(colors: [
                        const Color(0xFF60C18E).withOpacity(0.9),
                        const Color(0xFFFFFDE1).withOpacity(0.9),
                      ]),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: GradientText(
                        'Login',
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
                    Text(
                      'Continue with social',
                      style: body(color: grey800),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 1.3,
                          child: Checkbox(
                            checkColor: grey100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) =>
                                  const BorderSide(width: 1.0, color: grey500),
                            ),
                            focusColor: primary,
                            activeColor: primary,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'You agree with our ',
                            style: body(color: grey1100),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Term & Policy',
                                style: headline(color: grey1100),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Get here!');
                                  },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    AppWidget.typeButtonStartAction2(
                        context: context,
                        input: 'Continue with Apple',
                        bgColor: grey1100,
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(
                              Routes.home,
                              arguments: const Home(currentIndex: 0));
                        },
                        icon: apple,
                        colorAsset: grey100,
                        borderColor: grey1100,
                        textColor: grey100),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 24),
                      child: AppWidget.typeButtonStartAction2(
                          context: context,
                          input: 'Continue with Google',
                          bgColor: radicalRed1,
                          onPressed: isChecked
                              ? () async {
                                  final User firebaseUser =
                                      await AuthenticationGoogle
                                          .signInWithGoogle(context: context);
                                  if (firebaseUser.email != null) {
                                    Navigator.of(context).pushReplacementNamed(
                                        Routes.home,
                                        arguments: const Home(currentIndex: 0));
                                  }
                                }
                              : () {},
                          icon: google,
                          colorAsset: grey1100,
                          borderColor: radicalRed1,
                          textColor: grey1100),
                    ),
                    AppWidget.typeButtonStartAction2(
                        context: context,
                        input: 'Continue with Facebook',
                        bgColor: primary,
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(
                              Routes.home,
                              arguments: const Home(currentIndex: 0));
                        },
                        icon: facebook,
                        colorAsset: grey1100,
                        borderColor: primary,
                        textColor: grey1100),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 24),
                      child: AppWidget.typeButtonStartAction2(
                          context: context,
                          input: 'Continue with Twitter',
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed(
                                Routes.home,
                                arguments: const Home(currentIndex: 0));
                          },
                          bgColor: const Color(0xFF1D9BF0),
                          icon: twitter,
                          colorAsset: grey1100,
                          borderColor: const Color(0xFF1D9BF0),
                          textColor: grey1100),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
