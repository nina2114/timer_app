import 'package:flutter/material.dart';
import 'dart:async';

import 'package:timer/colors.dart';
import './settings.dart';
//import 'package:flutter_ringt';

//import './start.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //bool isRunning = false;
  // bool paused = false;

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
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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

//  void notify() {
//     if (_counter == '0') {
//       FlutterRingtonePlayer.playNotification();
//     }
//   }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: CustomColors.pastelGreenMaterialSwatch[50],
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //z
              GestureDetector(
                onTap: () {
                  setState(() {
                    const Settings();
                  });
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      color: CustomColors.pastelGreenMaterialSwatch[900],
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Text('$_counter',
                        style: Theme.of(context).textTheme.headline1),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              buttons(),
              // ElevatedButton(
              //     child: //Text('Start', style: Theme.of(context).textTheme.headline1),
              //         const Icon(
              //       Icons.play_circle_filled,
              //     ),
              //     onPressed: () {
              //       startTimer(reset: false);
              //       setState(() {
              //         isRunning = true;
              //       });
              //     }),
            ]),
      ));

  bool paused = false;

  Widget buttons() {
    bool isRunning = timer == null ? false : timer!.isActive;

    return !isRunning
        ? ElevatedButton(
            child: Text('Start', style: Theme.of(context).textTheme.headline1),
            onPressed: () {
              startTimer(reset: false);
              setState(() {
                isRunning = true;
              });
            })
        : !paused
            ? ElevatedButton(
                child:
                    Text('Stop', style: Theme.of(context).textTheme.headline1),
                onPressed: () {
                  stopTimer(reset: false);
                  setState(() {
                    isRunning = true;
                    paused = true;
                  });
                },
              )
            : GestureDetector(
                onTap: () {
                  startTimer(reset: false);
                  setState(() {
                    paused = false;
                  });
                },
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.green[300],
                  size: 30,
                )

                // ElevatedButton(
                //     child: Text('Something else',
                //         style: Theme.of(context).textTheme.headline1),
                //     onPressed: () {},
                );
  }
}
