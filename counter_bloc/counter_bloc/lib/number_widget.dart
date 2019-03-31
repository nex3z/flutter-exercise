import 'package:counter_bloc/bloc/bloc_provider.dart';
import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context);
    return StreamBuilder<int>(
      stream: bloc.count.stream,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Text(
              snapshot.data.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          );
        }
      },
    );
  }
}

//class _NumberWidgetState extends State<NumberWidget> {
//  CounterBloc _bloc;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _bloc = BlocProvider.of<IncrementBloc>(context);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Text('123'),
//    );
//  }
//}
