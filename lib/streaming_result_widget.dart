import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../request_state.dart';
import 'empty_list.dart';
import 'loading_widget.dart';
import 'some_thing_went_wrong_screen.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class StreamingResult extends StatelessWidget {
  final BehaviorSubject<RequestState> subject;
  final Widget? initWidget;
  final Widget? loadingWidget;
  final Widget successWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final VoidCallback? retry;

  const StreamingResult({
    Key? key,
    required this.subject,
    this.initWidget,
    this.loadingWidget,
    required this.successWidget,
    this.emptyWidget,
    this.errorWidget,
    this.retry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: subject.stream,
        builder: (context, AsyncSnapshot<RequestState> snapshot) {
          if (snapshot.data == null) return const SizedBox();
          switch (snapshot.data!.status) {
            case RequestStatus.init:
              return initWidget ??
                  Center(
                    child: Text(snapshot.data!.message),
                  );
            case RequestStatus.loading:
              return loadingWidget ?? const LoadingWidget();
            case RequestStatus.success:
              return successWidget;
            case RequestStatus.error:
              return errorWidget ??
                  SomeThingWentWrongScreen(
                      error: snapshot.data!.message, retry: retry ?? () {});
            case RequestStatus.empty:
              return emptyWidget ??
                  EmptyList(
                    message: snapshot.data!.message,
                  );
            case RequestStatus.loadMore:
              return Stack(
                children: [
                  successWidget,
                  Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 10.0,
                    child: loadingWidget ?? const LoadingWidget(),
                  )
                ],
              );
          }
        });
  }
}
