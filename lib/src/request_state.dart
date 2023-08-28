///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
enum RequestStatus { init, loading, success, error, empty, loadMore }

class RequestState {
  RequestStatus status = RequestStatus.init;
  String message = 'INITIAL';

  RequestState({required this.status, required this.message});
}
