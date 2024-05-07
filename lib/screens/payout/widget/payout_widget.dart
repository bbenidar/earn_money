import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';

Widget empty({bool isPayout = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Image.asset(onboarding2),
            )),
        Text(
          isPayout
              ? 'No payouts requested yet. Earn more points'
              : 'No payouts requested yet. Earn more points and cash out money.',
          textAlign: TextAlign.center,
          style: title4(color: grey1000),
        ),
        const Expanded(child: SizedBox())
      ],
    ),
  );
}

Widget done() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        checkCircle,
        width: 16,
        height: 16,
        color: grey1100,
      ),
      const SizedBox(width: 4),
      Text(
        'Done',
        style: subhead(color: grey1100),
      )
    ],
  );
}

Widget waiting() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        clock,
        width: 16,
        height: 16,
        color: primary,
      ),
      const SizedBox(width: 4),
      Text(
        'Waiting',
        style: subhead(color: primary),
      )
    ],
  );
}

Widget failed() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        xCircle,
        width: 16,
        height: 16,
        color: grey1100,
      ),
      const SizedBox(width: 4),
      Text(
        'Failed',
        style: subhead(color: grey1100),
      )
    ],
  );
}
