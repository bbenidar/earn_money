import 'package:flutter/material.dart';
import 'package:flutter_taearn/screens/payout/screen/payout.dart';
import 'package:flutter_taearn/screens/profile/screen/profile.dart';
import 'package:flutter_taearn/screens/profits/screen/profits.dart';
import 'package:flutter_taearn/screens/task_earn/screen/task_earn.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/images.dart';

class Home extends StatefulWidget {
  const Home({super.key, this.currentIndex = 0});
  final int currentIndex;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;
  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    listWidget = [
      const TaskEarn(),
      const Profits(),
      const Payout(),
      const Profile(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget.elementAt(_currentIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: Material(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              AppWidget.createItemNav(
                context,
                ic_bottom1,
                ic_bottom1,
                'Home',
              ),
              AppWidget.createItemNav(
                context,
                ic_bottom2,
                ic_bottom2,
                'Chart',
              ),
              AppWidget.createItemNav(
                context,
                ic_bottom3,
                ic_bottom3,
                'Wallet',
              ),
              AppWidget.createItemNav(
                context,
                ic_bottom4,
                ic_bottom4,
                'Setting',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
