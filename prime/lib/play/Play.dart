import 'dart:math';
import 'package:flutter/material.dart';
import 'package:prime/helper.dart';
import 'Ask.dart';
import 'Score.dart';
import 'Solve.dart';

class Play extends StatefulWidget {
  final int level;

  Play({
    this.level,
  });

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  final int max = 1005;
  int score, number, rounds;
  List<int> primes;

  @override
  void initState() {
    super.initState();
    score = 0;
    number = 0;
    rounds = widget.level + 1;
    primes = List();
    fill();
    generate();
  }

  fill() {
    for (int i = 2; i < max; i++) {
      if (isPrime(i)) {
        setState(() {
          primes.add(i);
        });
      }
    }
  }

  bool isPrime(int x) {
    for (int i = 2; i * i <= x; i++) {
      if (x % i == 0) {
        return false;
      }
    }
    return true;
  }

  generate() {
    int rand = Random().nextInt(3);
    if (rand == 0) {
      int prime = primes[Random().nextInt(primes.length)];
      setState(() {
        number = prime;
      });
    } else {
      int notPrime = Random().nextInt(max - 5) + 1;
      while (isPrime(notPrime)) {
        notPrime = Random().nextInt(max - 5) + 1;
      }
      setState(() {
        number = notPrime;
      });
    }
    setState(() {
      rounds--;
    });
    if (rounds == 0) {
      Navigator.pop(context);
    }
  }

  getAnswer(bool answer) {
    if (answer == isPrime(number)) {
      setState(() {
        score++;
      });
    }
    generate();
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
            Score(
              score: score,
            ),
            Ask(
              number: number,
            ),
            Solve(
              getAnswer: getAnswer,
            ),
          ],
        ),
      ),
    );
  }
}
