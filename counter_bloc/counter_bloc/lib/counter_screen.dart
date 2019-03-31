import 'package:counter_bloc/bloc/bloc_provider.dart';
import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:counter_bloc/number_widget.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  CounterBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CounterBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: BlocProvider<CounterBloc>(
        bloc: _bloc,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            NumberWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  child: Text('Add'),
                  onPressed: () => _bloc.dispatch(CounterEvent.plusOne),
                ),
                RaisedButton(
                  child: Text('Minus'),
                  onPressed: () => _bloc.dispatch(CounterEvent.minusOne),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
