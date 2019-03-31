import 'package:counter_bloc/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc extends BaseBloc<CounterEvent> {
  final BehaviorSubject<int> count = BehaviorSubject();
  int _count = 0;

  @override
  void dispose() {
    count.close();
  }

  @override
  void dispatch(CounterEvent event) {
    switch (event) {
      case CounterEvent.plusOne:
        _count++;
        count.sink.add(_count);
        break;
      case CounterEvent.minusOne:
        _count--;
        count.sink.add(_count);
        break;
    }
  }
}

enum CounterEvent { plusOne, minusOne }
