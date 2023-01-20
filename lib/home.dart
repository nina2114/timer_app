import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:timer/colors.dart';
import './settings.dart';
import 'logic/timer/timer_cubit.dart';
import 'models/enums.dart';

//import 'package:flutter_ringt';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static int _maxCounter = 65;
  int _counter = _maxCounter;
  Timer? timer;

//  void notify() {
//     if (_counter == '0') {
//       FlutterRingtonePlayer.playNotification();
//     }
//   }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: CustomColors.pastelGreenMaterialSwatch[50],
      body: Center(
        child: Container(
          height: 800,
          //alignment: Alignment.center,
          padding: EdgeInsets.only(top: 200),
          //margin: EdgeInsets.symmetric(),
          child: BlocBuilder<TimerCubit, TimerState>(
            builder: (context, state) {
              final TimerUpdated? timerState = (state is TimerUpdated) ? state : null;
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Center(
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Settings()),
                        ); //navigator, funktion aufrufen
                      },
                      child: SizedBox(
                        height: 300,
                        width: 300,
                        child: Stack(fit: StackFit.expand, children: [
                          Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 136, 161, 137),
                              borderRadius: BorderRadius.circular(150),
                              border: Border.all(
                                color: const Color.fromARGB(255, 219, 210, 210),
                                width: 4,
                              ),
                            ),
                            child: Center(
                              child: Text(_timerString(timerState!.counter),
                                  style: Theme.of(context).textTheme.headline2),
                            ),
                          ),
                          //CircularProgressIndicator(
                          //value: _counter / _maxCounter,
                          //valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 112, 111, 111)),
                          //strokeWidth: 8,
                          //)
                        ]),
                      ),
                    ),
                    //),
                    const SizedBox(height: 30),

                    //Timerbuttons

                     Expanded(
                      child: Column(children: <Widget>[
                        ...buttons(timerState!.status),
                      ]),
                    )                  ]);
            },
          ),
        ),
      ));

  String _timerString(int _maxCounter) {
    final d = Duration(seconds: _maxCounter);
    format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

    return format(d);
  }

  List buttons(TimerStatus status) {
    return [
      _buildStartAndStopButton(status),
      if (status == TimerStatus.stopped) _buildResetButton(),
    ];
  }

  Widget _buildStartAndStopButton(TimerStatus status) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            final timerCubit = BlocProvider.of<TimerCubit>(context);
            if (status == TimerStatus.initial ||
                status == TimerStatus.stopped) {
              timerCubit.startTimer();
            } else {
              timerCubit.stopTimer();
            }
          },
          child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                Container(
                    height: 50.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 206, 206, 206),
                      borderRadius: BorderRadius.circular(20),
                    )),
                Center(
                  child: Image.asset(
                    status == TimerStatus.initial ||
                            status == TimerStatus.stopped
                        ? "assets/icons/Start.png"
                        : "assets/icons/Pause.png",
                    height: 30,
                    width: 30,
                  ),
                )
              ]),
        ),
      ],
    );
  }

  Widget _buildResetButton() {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<TimerCubit>(context)
            .resetTimer(); //navigator, funktion aufrufen
      },
      child: Stack(fit: StackFit.loose, alignment: Alignment.center, children: [
        Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 206, 206, 206),
              borderRadius: BorderRadius.circular(25),
            )),
        Center(
          child: Image.asset(
            "assets/icons/Reset.png",
            height: 30,
            width: 30,
          ),
        )
      ]),
    );
  }
}
