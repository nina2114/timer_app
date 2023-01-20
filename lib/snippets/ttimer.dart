// import 'package:flutter/material.dart';

// class TimerCount extends StatefulWidget {
//   TimerCount({Key? key}) : super(key: key);
//   @override
//   _TimerCountState createState() => _TimerCountState();
// }

// class _TimerCountState extends State<TimerCount> {
//   @override
//   Widget build(BuildContext context) {
//   int _maxCounter = 10;
//   int _counter = _maxCounter;
//   Timer? timer;


//     timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
//       setState(() {
//         (_counter > 0) ? _counter-- : stopTimer(reset: false);
//       });
//     });
//   }

//   void resetTimer() => setState(() {
//         _counter = _maxCounter;
//       });

//   void startTimer({bool reset = true}) {
//     if (reset) {
//       resetTimer();
//     }



//   stopTimer({bool reset = true}) {
//     reset
//         ? resetTimer()
//         : setState(() {
//             timer?.cancel();
//           });
//   }}