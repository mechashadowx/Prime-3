import 'package:flutter/material.dart';
import 'package:prime/helper.dart';

class Header extends StatelessWidget {
  final title = 'Primes';
  final note = 'are you good in math?!';

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: data.size.width * 0.22,
                    color: gray,
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  note,
                  style: TextStyle(
                    fontSize: data.size.width * 0.06,
                    color: red,
                    fontWeight: FontWeight.w600,
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
