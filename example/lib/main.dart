import 'package:flutter/material.dart';
import 'products/bloc/products_bloc.dart';
import 'products/view/products_view.dart';
import 'package:rxdart_bloc/rxdart_bloc.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter rxdart_bloc example',
      home: BlocProvider<ProductsBloc>(
          bloc: ProductsBloc(), child: const ProductsView()),
    );
  }
}
