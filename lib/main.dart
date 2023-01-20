//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/logic/timer/timer_cubit.dart';
//import './timer.dart';
import 'home.dart';
import './colors.dart';
//import './settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditation Timer',
      theme: ThemeData(
        //scaffoldBackgroundColor: CustomColors.pastelGreenMaterialSwatch[900],
        
          primarySwatch: MaterialColor(0xA3CCB8, CustomColors.pastelGreenMaterialSwatch),
          textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w800,
          fontFamily: 'Hepta-Slab',
          color: Color.fromARGB(255, 84, 104, 93),
        ),
        headline2: TextStyle(
          fontSize: 60.0,
          fontFamily: 'Pangram-Black',
          color: Color.fromARGB(255,238,235,235),
        ),
      )),
      home: BlocProvider<TimerCubit>(
        create: (context) => TimerCubit(),
        child: Home(),
      ),
      //Settings(),
    );
  }
}
