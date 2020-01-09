import 'package:flutter/material.dart';
import 'package:prime/helper.dart';

class RoundsPicker extends StatefulWidget {
  final Function change;

  RoundsPicker({
    this.change,
  });

  @override
  _RoundsPickerState createState() => _RoundsPickerState();
}

class _RoundsPickerState extends State<RoundsPicker> {
  final pickerName = 'ROUNDS';

  Map<int, bool> rounds;

  @override
  void initState() {
    super.initState();
    rounds = Map();
    rounds[5] = false;
    rounds[10] = false;
    rounds[20] = true;
    rounds[50] = false;
  }

  Color isPicked(int level) {
    if (rounds == null) return gray;
    if (rounds[level]) {
      return red;
    } else {
      return gray;
    }
  }

  pick(int level) {
    setState(() {
      rounds.forEach((k, v) => rounds[k] = false);
      rounds[level] = true;
    });
    widget.change(level);
  }

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
                  pickerName,
                  style: TextStyle(
                    fontSize: data.size.width * 0.06,
                    color: red,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: data.size.width * 0.1),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RoundLevel(
                      level: 5,
                      size: data.size.width * 0.12,
                      background: isPicked(5),
                      pick: pick,
                    ),
                    RoundLevel(
                      level: 10,
                      size: data.size.width * 0.12,
                      background: isPicked(10),
                      pick: pick,
                    ),
                    RoundLevel(
                      level: 20,
                      size: data.size.width * 0.12,
                      background: isPicked(20),
                      pick: pick,
                    ),
                    RoundLevel(
                      level: 50,
                      size: data.size.width * 0.12,
                      background: isPicked(50),
                      pick: pick,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundLevel extends StatefulWidget {
  final int level;
  final double size;
  final Color background;
  final Function pick;

  RoundLevel({
    this.level,
    this.size,
    this.background,
    this.pick,
  });

  @override
  _RoundLevelState createState() => _RoundLevelState();
}

class _RoundLevelState extends State<RoundLevel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.pick(widget.level);
      },
      child: Container(
        margin: EdgeInsets.only(top: widget.size * 0.4),
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
          color: widget.background,
          borderRadius: BorderRadius.circular(widget.size),
        ),
        child: Center(
          child: Text(
            widget.level.toString(),
            style: TextStyle(
              fontSize: widget.size * 0.5,
              color: black,
            ),
          ),
        ),
      ),
    );
  }
}
