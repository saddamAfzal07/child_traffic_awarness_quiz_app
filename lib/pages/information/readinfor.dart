import 'dart:async';

import 'package:action_slider/action_slider.dart';
import 'package:child_traffic_awarness/pages/information/tipsawarness.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReadInfo extends StatefulWidget {
  const ReadInfo({Key? key}) : super(key: key);

  @override
  State<ReadInfo> createState() => _ReadInfoState();
}

class _ReadInfoState extends State<ReadInfo> {
  @override
  final AudioPlayer _player = AudioPlayer();
  runVoice() async {
    await _player.setAsset("assets/images/crash.mp3");
    await _player.play();
  }

  // Timer? timer;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   super.initState();
  //   runVoice();
  //   timer = Timer.periodic(Duration(seconds: 4), (Timer t) => runVoice());
  // }

  // @override
  // void dispose() {
  //   timer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TipsAwarness()));
            },
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 50,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Lottie.asset("assets/images/accidentfile.json"),
            Text(
              "INFORMATION",
              style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "A Traffic accident is defined as an accident involving at least one vehicle on a road open to public traffic in which at least one person is injured or killed \nAdditional information children aged one year to 4 years must sit in a car seat provided by thier parents",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17.sp),
            ),
            SizedBox(
              height: 100.h,
            ),
            // TextButton(
            //     onPressed: () async {
            //       await _player.setAsset("assets/images/crash.mp3");
            //       await _player.play();
            //        },
            //     child: Text("CLICK")),
            ActionSlider.standard(
              sliderBehavior: SliderBehavior.stretch,
              width: 300.w,
              child: Text(
                'Next',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
              toggleColor: Colors.lightGreenAccent,
              action: (controller) async {
                controller.loading(); //starts loading animation
                await Future.delayed(const Duration(seconds: 3), () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TipsAwarness()));
                });
                controller.success(); //starts success animation
                await Future.delayed(const Duration(seconds: 1));
                controller.reset(); //resets the slider
              },
            )
          ],
        ),
      ),
    );
  }
}
