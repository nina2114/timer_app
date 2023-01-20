part of 'timer_cubit.dart';

@immutable
abstract class TimerState {}

class TimerUpdated extends TimerState {
  final int counter;
  final TimerStatus status;
  TimerUpdated(this.counter, this.status);
}

class TimerUpdatedTheLongWay extends TimerState {
  late final int _counter;
  int get counter => _counter;

  late final TimerStatus _status;
  TimerStatus get status => _status;

  TimerUpdatedTheLongWay(int counter, TimerStatus status) {
    _counter = counter;
    _status = status;
  }
}
