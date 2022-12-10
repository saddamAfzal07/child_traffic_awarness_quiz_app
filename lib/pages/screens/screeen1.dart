import 'package:child_traffic_awarness/pages/screens/screen2.dart';
import 'package:child_traffic_awarness/widgets/heading.dart';
import 'package:child_traffic_awarness/widgets/higlight_answer.dart';
import 'package:child_traffic_awarness/widgets/nonhighlited.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
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
                    pageBuilder: (c, a1, a2) => Screen2(),
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
              Image.asset("assets/images/s1.png"),
              Heading(
                  heading:
                      "1) Do we have to utilie traffic  lights appropriately as Drivers ?"),
              HighlightAnswer(
                sign: "True",
                color: Colors.green.withOpacity(0.75),
                text:
                    "We have u utilie traffic lights appropriately because too many accidents cause driver didn,t followed road rules correctly.",
              ),
              const SizedBox(
                height: 22,
              ),
              Nonhiglighted(
                color: Colors.red,
                sign: "False",
                text:
                    "Drivers Don,t use traffic light Properly ,It can lead to speeding road accident sch as coliding with motobike or car on the road.",
              ),
            ],
          ),
        ));
  }
}
