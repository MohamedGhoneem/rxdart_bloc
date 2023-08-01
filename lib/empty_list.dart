import 'package:flutter/material.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class EmptyList extends StatelessWidget {
  final String? message;
  final Color? color;
  final double? fontSize;

  const EmptyList(
      {Key? key, required this.message, this.color, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message??'Empty list',
          style: TextStyle(
            fontSize: fontSize ?? 14,
            color: color ?? Theme.of(context).primaryColor,
          )),
    );
  }
}
