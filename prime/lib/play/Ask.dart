import 'package:flutter/material.dart';
import 'package:prime/helper.dart';

class Ask extends StatefulWidget {
  final int number;

  Ask({
    this.number,
  });

  @override
  _AskState createState() => _AskState();
}

class _AskState extends State<Ask> {
  final String top = 'is', bottom = 'prime?';

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: data.size.height * 0.03),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  top,
                  style: TextStyle(
                    color: red,
                    fontSize: data.size.width * 0.12,
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  widget.number.toString(),
                  style: TextStyle(
                    color: gray,
                    fontSize: data.size.width * 0.12 * 1.5,
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  bottom,
                  style: TextStyle(
                    color: red,
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
