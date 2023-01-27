import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:timer/colors.dart';
import 'package:timer/home.dart';

import 'package:flutter/cupertino.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Duration duration = const Duration(minutes: 30);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.pastelGreenMaterialSwatch[50],
      appBar: AppBar(
          backgroundColor: CustomColors.pastelGreenMaterialSwatch[50],
          automaticallyImplyLeading: false,
          elevation: 0.0,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: closeBtn(),
            )
          ]),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              timeContainer(),
              beginSoundContainer(),
              endSoundContainer(),
              volumeSoundContainer(),
            ],
          ),
        ),
      )),
    );
  }

  void _showTimerPicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.5,
            color: Colors.white,
            child: CupertinoTimerPicker(
              initialTimerDuration: duration,
              mode: CupertinoTimerPickerMode.hms,
              onTimerDurationChanged: (value) {
                if (value != duration) {
                  setState(() {
                    duration = value;
                  });
                }
              },
            ),
          );
        });
  }

  Widget closeBtn() {
    return Container(
        //height: 30,
        width: 55,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              //color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(250, 219, 210, 210),
                width: 5,
              ),
            ),
            child: const Center(
              child: Text(
                'X',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromARGB(255, 219, 210, 210)),
              ),
            ),
          ),
        ));
  }

  Widget timeContainer() {
    return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 1.0, color: Color.fromARGB(255, 241, 241, 241)),
          ),
        ),
        child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Time', style: Theme.of(context).textTheme.headline1),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        _showTimerPicker();
                      },
                      child: Container(
                        height: 40.0,
                        width: 90.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 116, 150, 123),
                          //color: const Color(0x001F363D),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          formatTime(duration),
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  String formatTime(Duration duration) {
    final formattedString = [
      duration.inHours % 24,
      duration.inMinutes % 60,
      duration.inSeconds % 60,
    ].map((e) => e.toString().padLeft(2, '0')).join(":");
    return formattedString;
  }

  Widget beginSoundContainer() {
    return Container(
        decoration: const BoxDecoration(
          border: const Border(
            bottom: BorderSide(
                width: 1.0, color: Color.fromARGB(255, 241, 241, 241)),
          ),
        ),
        child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Beginning Sound',
                        style: Theme.of(context).textTheme.headline1),
                    const SizedBox(height: 10),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        soundButtons(),
                      ],
                    ))
                  ],
                ),
              ),
            )));
  }

  Widget endSoundContainer() {
    return Container(
        decoration: const BoxDecoration(
          border: const Border(
            bottom: const BorderSide(
                width: 1.0, color: Color.fromARGB(255, 241, 241, 241)),
          ),
        ),
        child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('End Sound',
                        style: Theme.of(context).textTheme.headline1),
                    const SizedBox(height: 10),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [soundButtons()],
                    ))
                  ],
                ),
              ),
            )));

    ;
  }

  Widget volumeSoundContainer() {
    return Container(
        child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Volume',
                        style: Theme.of(context).textTheme.headline1),
                    const SizedBox(height: 10),
                    Container(
                        child: Image.asset(
                      "assets/icons/Regler.png",
                    ))
                  ],
                ),
              ),
            )));
  }

  Widget darkButton() {
    return Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 126, 141, 126),
          //color: CustomColors.pastelGreenMaterialSwatch[900],
          borderRadius: BorderRadius.circular(5),
        ));
  }

  Widget soundButtons() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(fit: StackFit.loose, children: [
          darkButton(),
          Image.asset(
            "assets/icons/Bell.png",
            height: 30,
            width: 30,
          ),
        ]),
        const SizedBox(width: 10),
        Stack(fit: StackFit.loose, children: [
          darkButton(),
          Image.asset(
            "assets/icons/Schale.png",
            height: 30,
            width: 30,
          ),
        ]),
        const SizedBox(width: 10),
        Stack(fit: StackFit.loose, children: [
          darkButton(),
          Image.asset(
            "assets/icons/Musik.png",
            height: 30,
            width: 30,
          ),
        ]),
        const SizedBox(width: 10),
        Stack(fit: StackFit.loose, children: [
          darkButton(),
          Image.asset(
            "assets/icons/Nichts.png",
            height: 30,
            width: 30,
          ),
        ]),
      ],
    ));
  }
}
