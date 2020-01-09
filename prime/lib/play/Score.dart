import 'package:flutter/material.dart';
import 'package:prime/helper.dart';

class Score extends StatefulWidget {
  final int score;

  Score({
    this.score,
  });

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  final title = 'POINTS';

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.only(top: data.size.height * 0.05),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: data.size.height * 0.01),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: red,
                    fontSize: data.size.width * 0.06,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: data.size.width * 0.32),
              decoration: BoxDecoration(
                color: red,
                borderRadius: BorderRadius.circular(data.size.width * 0.02),
              ),
              child: Center(
                child: Text(
                  widget.score.toString(),
                  style: TextStyle(
                    color: black,
                    fontSize: data.size.width * 0.12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
