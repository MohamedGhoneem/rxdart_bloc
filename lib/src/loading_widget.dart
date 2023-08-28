import 'package:flutter/material.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class LoadingWidget extends StatelessWidget {
  final Widget? loadingWidget;

  const LoadingWidget({Key? key, this.loadingWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loadingWidget ??
          CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation(Theme.of(context).primaryColor)),
    );
  }
}
