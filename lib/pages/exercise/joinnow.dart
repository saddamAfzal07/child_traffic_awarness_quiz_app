import 'package:action_slider/action_slider.dart';
import 'package:child_traffic_awarness/pages/exercise/exercise.dart';
import 'package:child_traffic_awarness/pages/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class joinNow extends StatefulWidget {
  const joinNow({Key? key}) : super(key: key);

  @override
  State<joinNow> createState() => _joinNowState();
}

class _joinNowState extends State<joinNow> {
  @override
  final _controller = ActionSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            "assets/images/joinnow.png",
            // color: Colors.green,
          ),
          Text("Start Quiz 😇",
              style: GoogleFonts.aclonica(
                textStyle: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900),
              )),
          ActionSlider.standard(
            sliderBehavior: SliderBehavior.stretch,
            width: 300.0.w,
            child: Text(
              'Join Now',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            toggleColor: Colors.lightGreenAccent,
            action: (controller) async {
              controller.loading(); //starts loading animation
              await Future.delayed(const Duration(seconds: 3), () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Exercise()));
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => Home(),
                    transitionsBuilder: (c, anim, a2, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(seconds: 1),
                  ),
                );
              });
              controller.success(); //starts success animation
              await Future.delayed(const Duration(seconds: 1));
              controller.reset(); //resets the slider
            },
          )
        ],
      ),
    );
  }
}
