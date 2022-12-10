import 'dart:async';

import 'package:child_traffic_awarness/pages/Answer/answer.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool dialgoue = false;
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;

  var value;

  truedialouge() {
    print("=====>>>>>");
    print("Truee");
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      title: 'True',
      desc: 'You are Awesome 😍',
      // btnCancelOnPress: () {},
      btnOkOnPress: () {
        if (endOfQuiz == true) {
          // ignore: avoid_single_cascade_in_expression_statements
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Quiz End ',
            desc: 'You Scored ${_totalScore}/${questions.length} ',
            btnOkOnPress: () {},
          )..show();
        } else {}
      },
    ).show();
  }

  falsedialouge() {
    print("=====>>>>>");
    print("Falsee");
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: 'False',
      desc: 'This time not correct 😕',
      // btnCancelOnPress: () {},
      btnOkOnPress: () {
        if (endOfQuiz == true) {
          // ignore: avoid_single_cascade_in_expression_statements
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Quiz End ',
            desc: 'You Scored ${_totalScore}/${questions.length} ',
            btnOkOnPress: () {},
          )..show();
        } else {}
      },
    ).show();
  }

  void _questionsAnswers(bool answerScore) {
    print(answerScore);
    setState(() {
      answerWasSelected = true;
      if (answerScore) {
        _totalScore++;
      }
      //show dialouge
      answerScore ? truedialouge() : falsedialouge();
      if (_questionIndex + 1 == questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
    });
    //What happened at the end of QUIZ
    if (_questionIndex >= questions.length) {
      _resetQuiz();
    }
  }

  _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      endOfQuiz = false;
    });
  }

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  void _doSomething() async {
    // Timer(Duration(seconds: 2), () {
    //   if (!answerWasSelected) {
    //     return;
    //   }
    //   _btnController.success();
    //   _nextQuestion();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                      height: 350.h,
                      width: 300.w,
                      child: Image.asset(
                        questions[_questionIndex]["images"].toString(),
                      )),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    questions[_questionIndex]["qestions"].toString(),
                    style: TextStyle(
                        fontSize: 20.0.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ...(questions[_questionIndex]["answers"]
                        as List<Map<String, Object>>)
                    .map((answer) => Answer(
                          AnswerText: answer["answerstext"].toString(),
                          answerColor: answerWasSelected
                              ? answer["scrore"] == true
                                  ? Colors.green
                                  : Colors.red
                              : Colors.transparent,
                          answerTap: () {
                            //If Answer was already selected nothing happens on tap
                            if (answerWasSelected) {
                              return;
                            }
                            value = answer["scrore"];

                            _questionsAnswers(value);
                          },
                        )),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    if (!answerWasSelected) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.WARNING,
                        animType: AnimType.BOTTOMSLIDE,
                        title: 'Select Options 🤩',
                        desc: 'None of the Option is selected!',
                        btnOkOnPress: () {},
                      ).show();
                      return;
                    }
                    _nextQuestion();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      height: 46,
                      width: double.infinity,
                      child: Text(
                        endOfQuiz ? "Restart Quiz" : "Next Question",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}

final questions = [
  {
    "qestions":
        "1) Do we have to utilize traffic lights appropriately as drivers ?",
    "images": "assets/images/s1.png",
    "answers": [
      {
        "answerstext":
            "we have to utilie traffic lights appropriately because too many accidents cause drivers did not follow road rules properly",
        "scrore": true,
      },
      {
        "answerstext":
            "Drivers do not use traffic light properly, it can lead to speedy road accident such as coliding with motor bikes or car on the road ",
        "scrore": false,
      },
    ]
  },
  {
    "qestions":
        "2) Will there be a road accident if a vehicle does not keep a decent distance while driving ?",
    "images": "assets/images/s2.png",
    "answers": [
      {
        "answerstext":
            "The driver does not have to preserve his car at a distance of 3 meters",
        "scrore": false,
      },
      {
        "answerstext":
            "To avoid road accidents, a sensible driver will preserve his car at a distance of 3 meters",
        "scrore": true,
      },
    ]
  },
  {
    "qestions":
        "3) If a vehicle in the same position if someone applies his vehicle signal to change lanes ?",
    "images": "assets/images/s3.png",
    "answers": [
      {
        "answerstext":
            "Signal light indicate which car is behind or in front of which direction we wish to turn ",
        "scrore": true,
      },
      {
        "answerstext":
            "To avoid road accidents, a sensible driver will preserve his car at a distance of 3 meters",
        "scrore": false,
      },
    ]
  },
  {
    "qestions":
        "4) As a driver, is it possible to drive in a state of body fatigue?",
    "images": "assets/images/s4.png",
    "answers": [
      {
        "answerstext":
            "Driver can drive with insufficient rest and tiredness till they get at thier destination ",
        "scrore": false,
      },
      {
        "answerstext":
            "The driver should get enough rest before beggining the journey or if tired the driver cold stop at a nearby R & rest area.",
        "scrore": true,
      },
    ]
  },
  {
    "qestions": "5) Can a driver drive while his or her licence has expired?",
    "images": "assets/images/s5.png",
    "answers": [
      {
        "answerstext":
            "Those who are not detained by the JPG with ot a driving licence for the type of vehicle they are carring (motor licence while riding in a motorcycle)will be fined. The JPG will fine those who are detained.",
        "scrore": false,
      },
      {
        "answerstext":
            "Driver are not allowed to drive once thier licence expired in order to avoid accidents and they are fined if they don not have a licene for the sort of vehicle they are driving",
        "scrore": true,
      },
    ]
  },
  {
    "qestions":
        "6) Can the driver use or play the phone while driving on the road?",
    "images": "assets/images/s6.png",
    "answers": [
      {
        "answerstext": "Drive may use the mobile phone while driving ",
        "scrore": false,
      },
      {
        "answerstext":
            "The consequences of using a mobile phone while driving is that it cause trobule focusing affect steering control and lead to road accidents",
        "scrore": true,
      },
    ]
  },
  {
    "qestions":
        "7) Should the driver put on the seat belt before initiating the jorney ?",
    "images": "assets/images/s7.png",
    "answers": [
      {
        "answerstext":
            "Drivers are required to wear belt in to avoid being thrown ot of the car,s windshield in the instance of an accident.",
        "scrore": true,
      },
      {
        "answerstext":
            "Drivers are not required to use seat belts in order to avoid being thrown out of the car,s windshield in the instance of an accident.",
        "scrore": false,
      },
    ]
  },
  {
    "qestions":
        "8) A a driver can we use dummy buckle with out pulling the seat belt?",
    "images": "assets/images/s8.png",
    "answers": [
      {
        "answerstext":
            "The driver is not reqired to place the dummy buckle into theseat belt hook and wait for the warning alarm to sound nor is required towear a seat belt while driving",
        "scrore": false,
      },
      {
        "answerstext":
            "If the driver fails not insert the dummy buckle into the seat belt hook a warning sound ring and the driver will noticed that he or she does not wearnig seat belt and if accident occurs the driver may sustain significant injuries",
        "scrore": true,
      },
    ]
  },
  {
    "qestions":
        "9)  As a driver who bring children,do we need to provide car seats for children underthe age of 1 to 4 years for thier safety is guaranted ?",
    "images": "assets/images/s9.png",
    "answers": [
      {
        "answerstext":
            "The driver is not utilise a car seat for the protection of child while driving ",
        "scrore": false,
      },
      {
        "answerstext":
            "To avoid accidents car seats for kids aged 1-4 years are required to avoid the baby falling while being carried or being thrown during a car accident ",
        "scrore": true,
      },
    ]
  },
  {
    "qestions":
        "10)  As a driver, is it legal for vehicle to cut on double line  ?",
    "images": "assets/images/s10.png",
    "answers": [
      {
        "answerstext":
            "Drivers are not permitted to cross the double lines considering that doing so might endanger other road users ",
        "scrore": true,
      },
      {
        "answerstext":
            "Drivers are allowed to cross double line and not endanger other road users.",
        "scrore": false,
      },
    ]
  }
];
