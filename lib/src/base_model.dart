///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
abstract class BaseModel<T> {
  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();

  // T? decodingFromJson(String str) {
  //   return null;
  // }
  //
  // String? encodingToJson() {
  //   return null;
  // }
}
