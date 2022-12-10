import 'package:flutter/material.dart';

class HighlightAnswer extends StatefulWidget {
  String sign;
  String text;
  Color color;

  HighlightAnswer({
    Key? key,
    required this.sign,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  State<HighlightAnswer> createState() => _HighlightAnswerState();
}

class _HighlightAnswerState extends State<HighlightAnswer> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
          alignment: Alignment.center,
          width: 50,
          height: 200,
          decoration: BoxDecoration(
            color: widget.color, // border color
            shape: BoxShape.circle,
          ),
          child: Text(
            widget.sign,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
      subtitle: Text(
        widget.text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 14,
        ),
      ),
    );
  }
}
