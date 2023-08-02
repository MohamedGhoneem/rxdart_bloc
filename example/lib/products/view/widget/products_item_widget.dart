import 'package:flutter/material.dart';
import '../../model/products_response_model.dart';
///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class ProductsItemWidget extends StatelessWidget {
  final Products? content;

  const ProductsItemWidget({Key? key, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(.4), width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Text(
        content?.title ?? '',
        style: const TextStyle(
            fontFamily: '', fontSize: 18, color: Colors.black),
      ),
    );
  }
}
