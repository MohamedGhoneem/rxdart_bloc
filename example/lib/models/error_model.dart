import 'dart:convert';

import 'package:rxdart_bloc/rxdart_bloc.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class ErrorModel extends BaseModel<ErrorModel> {
  int? statusCode;
  String? message;
  Errors? errors;

  ErrorModel({this.statusCode, this.message, this.errors});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['message'] = message;
    if (errors != null) {
      data['errors'] = errors!.toJson();
    }
    return data;
  }

  @override
  ErrorModel fromJson(Map<String, dynamic>? json) {
    return ErrorModel.fromJson(json!);
  }

  @override
  ErrorModel decodingFromJson(String str) {
    // TODO: implement decodingFromJson
    return ErrorModel.fromJson(json.decode(str));
  }

  @override
  String encodingToJson() {
    // TODO: implement encodingToJson
    return json.encode(toJson());
  }

  @override
  String toString() {
    return 'ErrorModel($statusCode): $message';
  }
}

class Errors {
  List<String>? errors;

  Errors({this.errors});

  Errors.fromJson(Map<String, dynamic> json) {
    errors = json['errors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['errors'] = errors;
    return data;
  }
}
