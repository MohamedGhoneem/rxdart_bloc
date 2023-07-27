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
  final Widget successWidget;
  final Widget? emptyListWidget;
  final Widget? errorWidget;
  final VoidCallback? retry;
  final double? loadingHeight;

  const StreamingResult(
      {Key? key,
      required this.subject,
      required this.successWidget,
      this.emptyListWidget,
      this.errorWidget,
      this.retry,
      this.loadingHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: subject.stream,
        builder: (context, AsyncSnapshot<RequestState> snapshot) {
          if (snapshot.data == null) return const SizedBox();
          switch (snapshot.data!.status) {
            case RequestStatus.init:
              return SizedBox(height: loadingHeight, child: const SizedBox());
            case RequestStatus.loading:
              return SizedBox(
                  height: loadingHeight, child: const LoadingWidget());
            case RequestStatus.success:
              return successWidget;
            case RequestStatus.error:
              return Center(
                  child: errorWidget ??
                      SomeThingWentWrongScreen(
                          error: snapshot.data!.message,
                          retry: retry ?? () {}));
            case RequestStatus.empty:
              return emptyListWidget ??
                  Center(
                    child: EmptyList(
                      message: snapshot.data!.message,
                    ),
                  );
            case RequestStatus.loadMore:
              return Stack(
                children: [
                  successWidget,
                  const Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 10.0,
                    child: LoadingWidget(),
                  )
                ],
              );
          }
        });
  }
}
