import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_taearn/screens/onboarding/screen/onboarding.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../common/constant/dark_mode.dart';
import '../common/route/route_generator.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: 'Main Navigator');

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      initialRoute: '/',
      navigatorKey: navigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
      title: 'Taearn',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      home: const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: OnBoarding(),
      ),
    );
  }
}
