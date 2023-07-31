import 'package:flutter/material.dart';
import 'package:rxdart_bloc/bloc_provider.dart';

import 'products/bloc/products_bloc.dart';
import 'products/view/products_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter rxdart_bloc example',
      home: BlocProvider(bloc: ProductsBloc(), child: const ProductsView()),
    );
  }
}
