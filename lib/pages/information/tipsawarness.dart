import 'package:action_slider/action_slider.dart';
import 'package:child_traffic_awarness/constant/info.dart';
import 'package:child_traffic_awarness/pages/exercise/joinnow.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TipsAwarness extends StatefulWidget {
  const TipsAwarness({Key? key}) : super(key: key);

  @override
  State<TipsAwarness> createState() => _TipsAwarnessState();
}

class _TipsAwarnessState extends State<TipsAwarness> {
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
                  context, MaterialPageRoute(builder: (context) => joinNow()));
            },
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 50,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Lottie.asset("assets/images/accident.json"),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Tips for avoiding road \n accidents",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: info.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ListTile(
                        tileColor: Colors.yellow,
                        // leading: Icon(Icons.circle),
                        title: Text(
                          info[index].title,

                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: Lottie.asset(
                          "assets/images/true.json",
                        ),
                      ),
                    );
                  })),
              const SizedBox(
                height: 50,
              ),
              ActionSlider.standard(
                sliderBehavior: SliderBehavior.stretch,
                width: 300.0,
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.white,
                toggleColor: Colors.lightGreenAccent,
                action: (controller) async {
                  controller.loading(); //starts loading animation
                  await Future.delayed(const Duration(seconds: 3), () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const joinNow()));
                  });
                  controller.success(); //starts success animation
                  await Future.delayed(const Duration(seconds: 1));
                  controller.reset(); //resets the slider
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
