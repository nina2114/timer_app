// import 'package:flutter/material.dart';

// import './timer.dart';

// class Buttons extends StatefulWidget {
//   const Buttons({Key? key}) : super(key: key);
  
//   @override
//   State<StatefulWidget> createState() => _ButtonsState();
// }

// class _ButtonsState extends State<Buttons> {
//   @override
//   Widget build(BuildContext context) {
//     //bool isRunning = false;
//     bool isRunning = timer == null ? false : timer!.isActive;
//     bool paused = false;

//     return isRunning && !paused
//         ?
//         //!paused ? //(läuft aber nicht pausiert?)
//         ElevatedButton(
//             child: Text('Stop', style: Theme.of(context).textTheme.headline1),
//             onPressed: () {
//               isRunning ? stopTimer(reset: false) : startTimer(reset: false);
//             })
//         : ElevatedButton(
//             child: Text('Start', style: Theme.of(context).textTheme.headline1),
//             onPressed: () {
//               !isRunning ? startTimer(reset: false) : startTimer(reset: true);
//             },
//           );
//   }