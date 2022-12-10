import 'package:action_slider/action_slider.dart';
import 'package:child_traffic_awarness/pages/information/readinfor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationAwarness extends StatefulWidget {
  const InformationAwarness({Key? key}) : super(key: key);

  @override
  State<InformationAwarness> createState() => _InformationAwarnessState();
}

class _InformationAwarnessState extends State<InformationAwarness> {
  final _controller = ActionSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              "assets/images/inf.png",
            ),
          ),
          ActionSlider.standard(
            sliderBehavior: SliderBehavior.stretch,
            width: 300.0.w,
            child: Text(
              'Read Now',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            toggleColor: Colors.lightGreenAccent,
            action: (controller) async {
              controller.loading(); //starts loading animation
              await Future.delayed(const Duration(seconds: 3), () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReadInfo()));
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
