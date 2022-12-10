import 'package:flutter/material.dart';

class Heading extends StatefulWidget {
  String heading;
  Heading({Key? key, required this.heading}) : super(key: key);

  @override
  State<Heading> createState() => _HeadingState();
}

class _HeadingState extends State<Heading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Text(
        widget.heading,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}
