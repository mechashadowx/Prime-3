import 'package:flutter/material.dart';
import 'package:prime/helper.dart';
import 'package:prime/play/Play.dart';
import 'Header.dart';
import 'RoundsPicker.dart';
import 'Start.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int level;

  @override
  void initState() {
    super.initState();
    level = 20;
  }

  change(int l) {
    setState(() {
      level = l;
    });
  }

  start() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Play(level: level),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Header(),
            RoundsPicker(
              change: change,
            ),
            Start(
              start: start,
            ),
          ],
        ),
      ),
    );
  }
}
