import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Answer extends StatefulWidget {
  final String AnswerText;
  final Color answerColor;
  final Function answerTap;
  const Answer(
      {Key? key,
      required this.AnswerText,
      required this.answerColor,
      required this.answerTap})
      : super(key: key);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.answerTap();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.answerColor,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.AnswerText,
          style: TextStyle(fontSize: 14.00.sp),
        ),
      ),
    );
  }
}
