import 'package:flutter/material.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class SomeThingWentWrongScreen extends StatelessWidget {
  final Widget? errorWidget;
  final String? error;
  final VoidCallback retry;

  const SomeThingWentWrongScreen(
      {Key? key, this.errorWidget, this.error, required this.retry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return errorWidget ??
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Error',
              style: TextStyle(fontSize: 18, color: Colors.red),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            Text(
              error ?? 'Some Thing Went Wrong',
              style: const TextStyle(fontSize: 16, color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: retry,
              child: const Text('Refresh'),
            ),
          ],
        );
  }
}
