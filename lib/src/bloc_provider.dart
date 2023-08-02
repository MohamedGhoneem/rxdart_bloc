import 'package:flutter/material.dart';

import '../rxdart_bloc.dart';
import 'base_bloc.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///

// class BlocProvider<T extends BaseBloc> extends StatefulWidget {
//   final T bloc;
//   final Widget child;
//
//   const BlocProvider({
//     Key? key,
//     required this.bloc,
//     required this.child,
//   }) : super(key: key);
//
//
//   @override
//   _BlocProviderState<T> createState() {
//     return _BlocProviderState<T>();
//   }
//
//   static T of<T extends BaseBloc>(BuildContext context) {
//     BlocProvider<T>? provider = context.findAncestorWidgetOfExactType();
//     return provider!.bloc;
//   }
// }
//
// class _BlocProviderState<T> extends State<BlocProvider<BaseBloc>> {
//   @override
//   void dispose() {
//     widget.bloc.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }
// }

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///

class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  final T bloc;
  final Widget child;

  const BlocProvider({
    Key? key,
    required this.bloc,
    required this.child,
  }) : super(key: key);

  @override
  _BlocProviderState<T> createState() {
    return _BlocProviderState<T>();
  }

  // static T of<T extends BaseBloc>(BuildContext context) {
  //   BlocProvider<T>? provider = context.findAncestorWidgetOfExactType();
  //   return provider!.bloc;
  // }
  // static T of<T extends BaseBloc>(BuildContext context) {
  //   final provider = context.findAncestorWidgetOfExactType<MultiBlocProvider<List<BaseBloc>>>();
  //   final blocs = provider?.blocs.cast<T>();
  //   if (blocs == null || blocs.isEmpty) {
  //     throw FlutterError('BlocProvider.of() called with a context that does not contain a $T instance.');
  //   }
  //   return blocs.first;
  // }

  static T of<T extends BaseBloc>(BuildContext context) {
    final provider = context.findAncestorWidgetOfExactType<MultiBlocProvider<List<BaseBloc>>>();
    final blocs = provider?.blocs.whereType<T>();
    if (blocs == null || blocs.isEmpty) {
      throw FlutterError('BlocProvider.of() called with a context that does not contain a $T instance.');
    }
    return blocs.first;
  }

}

class _BlocProviderState<T> extends State<BlocProvider<BaseBloc>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider<List<BaseBloc>>(
      blocs: [widget.bloc],
      child: widget.child,
    );
  }
}
