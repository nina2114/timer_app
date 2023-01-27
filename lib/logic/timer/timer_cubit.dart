import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/enums.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerUpdated(_maxCounter, TimerStatus.initial));
  Timer? timer;
  static const int _maxCounter = 5;
  int _counter = _maxCounter;

  void startTimer() {
    emit(TimerUpdated(_counter, TimerStatus.running));
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        _counter--;
        emit(TimerUpdated(_counter, TimerStatus.running));
      } else {
        //todo: trigger animation and sounds logic here
        resetTimer();
      }
    });
  }

  void stopTimer() {
    emit(TimerUpdated(_counter, TimerStatus.stopped));
    if (timer != null) {
      timer!.cancel();
    }
  }

  void resetTimer() {
    timer!.cancel();
    _counter = _maxCounter;
    emit(TimerUpdated(_counter, TimerStatus.initial));
  }
}
