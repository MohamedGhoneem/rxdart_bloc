import 'package:rxdart/rxdart.dart';

import 'base_model.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
mixin RxdartBlocState<T extends BaseModel<T>, E extends BaseModel<E>> {
  PublishSubject<T> successSubject = PublishSubject();

  Stream<T> get successStream => successSubject.stream;

  PublishSubject<E> errorSubject = PublishSubject();

  Stream<E> get errorStream => errorSubject.stream;

  void dispose() {
    successSubject.close();
    errorSubject.close();
  }
}
