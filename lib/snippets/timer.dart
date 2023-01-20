import 'package:flutter/material.dart';
import 'dart:async';

//import './start.dart';

class TimerGo extends StatefulWidget {
  TimerGo({Key? key}) : super(key: key);
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<TimerGo> {
  static int _maxCounter = 10;
  int _counter = _maxCounter;
  Timer? timer;

  void resetTimer() => setState(() {
        _counter = _maxCounter;
      });

  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        (_counter > 0) ? _counter-- : stopTimer(reset: false);
      });
    });
  }

  void stopTimer({bool reset = true}) {
    reset
        ? resetTimer()
        : setState(() {
            timer?.cancel();
          });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Color.fromARGB(255, 150, 180, 115),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.green[600],
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Text('$_counter',
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
              const SizedBox(height: 30),
              Buttons(),
            ]),
      ));

  Widget Buttons() {
    bool isRunning = timer == null ? false : timer!.isActive;
    bool paused = false;
    return isRunning && !paused
        ? ElevatedButton(
            child: Text('Stop', style: Theme.of(context).textTheme.headline1),
            onPressed: () {
              stopTimer(reset: false);
              //isRunning ? stopTimer(reset: false) : startTimer(reset: false);
            })
        : ElevatedButton(
            child: Text('Start', style: Theme.of(context).textTheme.headline1),
            onPressed: () {
              if (isRunning == false) {
                startTimer(reset: true);
                print('huhi');
              } else {
                startTimer(reset: false);
              }
            },
          );
  }
}
