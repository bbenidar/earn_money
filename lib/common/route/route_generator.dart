import 'package:flutter/material.dart';

import '../../screens/authentication/screen/login.dart';
import '../../screens/home/screen/home.dart';
import '../../screens/home/screen/notification.dart';
import '../../screens/home/screen/set_account.dart';
import '../../screens/payout/screen/detail_payout.dart';
import '../../screens/profile/screen/achievements.dart';
import '../../screens/profile/screen/how_to_work.dart';
import '../../screens/task_action/screen/install_app.dart';
import '../../screens/task_action/screen/survey.dart';
import 'routes.dart';

mixin RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // / route catalog onBoarding
      case Routes.onBoarding:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Scaffold(),
        );
      case Routes.login:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Login(),
        );
      case Routes.survey:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Survey(),
        );
      case Routes.taskEarn:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Home(),
        );
      case Routes.installApp:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const InstallApp(),
        );
      case Routes.howToWork:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const HowToWork(),
        );
      case Routes.achievements:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Achievements(),
        );
      case Routes.detailPayout:
        final DetailPayout args = settings.arguments as DetailPayout;
        return MaterialPageRoute<dynamic>(
          builder: (context) => DetailPayout(item: args.item),
        );
      case Routes.notification:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ListNotification(),
        );
      case Routes.setAccount:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SetAccount(),
        );
      case Routes.home:
        final Home args = settings.arguments as Home;
        return MaterialPageRoute<dynamic>(
          builder: (context) => Home(
            currentIndex: args.currentIndex,
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
