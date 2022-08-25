import 'package:fifty/global.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 150,
        child: FloatingActionButton.extended(
          clipBehavior: Clip.hardEdge,
          isExtended: true,
          onPressed: () => Navigator.pop(context),
          label: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                gradient: Global.colors.gradient,
              ),
              child: Center(
                  child: Text(
                'Stop Timer',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
