import 'package:flutter/cupertino.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.visible}) : super(key: key);
  final bool? visible;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: visible! ? 1.0 : 0.0,
      child: Container(
        alignment: FractionalOffset.center,
        child: const CupertinoActivityIndicator(),
      ),
    );
  }
}
