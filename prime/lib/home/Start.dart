import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  final Function start;

  Start({
    this.start,
  });

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return GestureDetector(
      onTap: widget.start,
      child: Container(
        child: Center(
          child: Image(
            height: data.size.width * 0.22,
            width: data.size.width * 0.22,
            image: AssetImage('assets/start.png'),
          ),
        ),
      ),
    );
  }
}
