import 'package:flutter/material.dart';
import '../rxdart_bloc.dart';
///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class MultiBlocProvider<T extends List<BaseBloc>> extends StatefulWidget {
  final T blocs;
  final Widget child;

  const MultiBlocProvider({
    Key? key,
    required this.blocs,
    required this.child,
  }) : super(key: key);

  @override
  _MultiBlocProviderState createState() => _MultiBlocProviderState();

  static T of<T extends List<BaseBloc>>(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<_InheritedMultiBlocProvider<T>>();
    if (provider == null) {
      throw FlutterError('MultiBlocProvider.of() called with a context that does not contain a MultiBlocProvider.');
    }
    return provider.blocs;
  }
}

class _MultiBlocProviderState extends State<MultiBlocProvider> {
  @override
  void dispose() {
    for (final bloc in widget.blocs) {
      bloc.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedMultiBlocProvider(
      blocs: widget.blocs,
      child: widget.child,
    );
  }
}

class _InheritedMultiBlocProvider<T extends List<BaseBloc>> extends InheritedWidget {
  final T blocs;

  _InheritedMultiBlocProvider({
    Key? key,
    required this.blocs,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedMultiBlocProvider oldWidget) {
    return blocs != oldWidget.blocs;
  }
}
