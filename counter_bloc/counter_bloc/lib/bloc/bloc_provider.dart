import 'package:counter_bloc/bloc/base_bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider<Bloc extends BaseBloc> extends StatefulWidget {
  final Bloc bloc;
  final Widget child;

  BlocProvider({
    Key key,
    @required this.bloc,
    @required this.child,
  }) : super(key: key);

  @override
  _BlocProviderState<Bloc> createState() => _BlocProviderState<Bloc>();

  static T of<T extends BaseBloc>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T> extends State<BlocProvider<BaseBloc>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
