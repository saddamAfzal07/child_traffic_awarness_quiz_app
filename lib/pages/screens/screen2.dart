import 'package:child_traffic_awarness/pages/screens/scree3.dart';
import 'package:child_traffic_awarness/widgets/heading.dart';
import 'package:child_traffic_awarness/widgets/higlight_answer.dart';
import 'package:child_traffic_awarness/widgets/nonhighlited.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => Screen3(),
                    transitionsBuilder: (c, anim, a2, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(seconds: 1),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/screen2.png"),
              Heading(
                  heading:
                      "2)Will therebe a road Accident if a vehicle does not keep a decent distance while driving"),
              Nonhiglighted(
                color: Colors.red,
                sign: "True",
                text:
                    "To avoid road accident a sensible driver will preserve his car at a distance of 3 meters",
              ),
              const SizedBox(
                height: 30,
              ),
              HighlightAnswer(
                sign: "False",
                color: Colors.green.withOpacity(0.75),
                text:
                    "The Driver doesn,t have to be preserve his car at a distance of 3 meters",
              ),
            ],
          ),
        ));
  }
}
