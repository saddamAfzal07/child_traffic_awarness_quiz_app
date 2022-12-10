import 'package:child_traffic_awarness/widgets/heading.dart';
import 'package:child_traffic_awarness/widgets/higlight_answer.dart';
import 'package:child_traffic_awarness/widgets/nonhighlited.dart';
import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
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
                // Navigator.push(
                //   context,
                //   PageRouteBuilder(
                //     pageBuilder: (c, a1, a2) => Screen3(),
                //     transitionsBuilder: (c, anim, a2, child) =>
                //         FadeTransition(opacity: anim, child: child),
                //     transitionDuration: Duration(seconds: 1),
                //   ),
                // );
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
              Image.asset("assets/images/s4.png"),
              Heading(
                  heading:
                      "4)As a driver is it possible to drive in a state of body Fatigue?"),
              HighlightAnswer(
                sign: "False",
                color: Colors.green.withOpacity(0.75),
                text: "The driver should enough rest ",
              ),
              const SizedBox(
                height: 30,
              ),
              Nonhiglighted(color: Colors.red, sign: "True", text: ""),
            ],
          ),
        ));
  }
}
