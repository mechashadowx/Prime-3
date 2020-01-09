import 'package:flutter/material.dart';
import 'package:prime/helper.dart';

class Solve extends StatefulWidget {
  final Function getAnswer;

  Solve({
    this.getAnswer,
  });

  @override
  _SolveState createState() => _SolveState();
}

class _SolveState extends State<Solve> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      height: data.size.height * 0.2,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: data.size.width * 0.15),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Draggable<bool>(
                      data: false,
                      child: Container(
                        child: Center(
                          child: Image(
                            height: data.size.width * 0.16,
                            width: data.size.width * 0.16,
                            image: AssetImage('assets/false.png'),
                          ),
                        ),
                      ),
                      childWhenDragging: Container(
                        color: black,
                        height: data.size.width * 0.16,
                        width: data.size.width * 0.16,
                      ),
                      feedback: Container(
                        child: Center(
                          child: Image(
                            height: data.size.width * 0.16,
                            width: data.size.width * 0.16,
                            image: AssetImage('assets/false.png'),
                          ),
                        ),
                      ),
                    ),
                    Draggable<bool>(
                      data: true,
                      child: Container(
                        child: Center(
                          child: Image(
                            height: data.size.width * 0.16,
                            width: data.size.width * 0.16,
                            image: AssetImage('assets/true.png'),
                          ),
                        ),
                      ),
                      childWhenDragging: Container(
                        color: black,
                        height: data.size.width * 0.16,
                        width: data.size.width * 0.16,
                      ),
                      feedback: Container(
                        child: Center(
                          child: Image(
                            height: data.size.width * 0.16,
                            width: data.size.width * 0.16,
                            image: AssetImage('assets/true.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DragTarget<bool>(
              builder: (context, incoming, rejected) {
                return Container(
                  child: Center(
                    child: Image(
                      height: data.size.width * 0.17,
                      width: data.size.width * 0.17,
                      image: AssetImage('assets/target.png'),
                    ),
                  ),
                );
              },
              onAccept: (answer) {
                widget.getAnswer(answer);
              },
            ),
          ],
        ),
      ),
    );
  }
}
