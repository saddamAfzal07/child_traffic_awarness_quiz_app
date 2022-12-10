import 'package:child_traffic_awarness/widgets/heading.dart';
import 'package:child_traffic_awarness/widgets/higlight_answer.dart';
import 'package:child_traffic_awarness/widgets/nonhighlited.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
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
                //     pageBuilder: (c, a1, a2) => Screen2(),
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
              Image.asset("assets/images/s3.png"),
              Heading(
                  heading:
                      "3)Is the vehicle in a safe position if someone applies his vehicle signal to change lanes?"),
              HighlightAnswer(
                sign: "True",
                color: Colors.green.withOpacity(0.75),
                text:
                    "Signal lights indicate which car is behind or in front of which direction we wish to turn allowing the front and rear vehicle to be prepared for any situation ",
              ),
              const SizedBox(
                height: 22,
              ),
              Nonhiglighted(
                  color: Colors.red,
                  sign: "False",
                  text:
                      "The Driver does not need to give a signal light to the vehicle that is behind or in front of which direction we want to turn so that the vehicle in front and behind can be prepared for any possibility."),
            ],
          ),
        ));
  }
}
