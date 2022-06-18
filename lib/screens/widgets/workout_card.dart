import 'package:fifty/models/workout.dart';
import 'package:fifty/providers/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutCard extends StatefulWidget {
  const WorkoutCard({Key? key, required this.workout}) : super(key: key);

  final Workout workout;

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  int getCurrentCount() {
    DateTime now = DateTime.now();

    DateTime key = widget.workout.workouts.keys.firstWhere(
        (element) =>
            element.year == now.year &&
            element.month == now.month &&
            element.day == now.day, orElse: () {
      widget.workout.workouts.addAll({now: 0});
      return now;
    });

    return widget.workout.workouts[key]!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,

      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0XFFDB7343),
            Color(0XFF3D7695),
          ],
        ),
      ),

      // decoration: ShapeDecoration(
      //     shape: ContinuousRectangleBorder(
      //       borderRadius: BorderRadius.circular(28),
      //     ),
      //     color: Colors.grey.shade500
      //     // gradient: LinearGradient(
      //     //   begin: Alignment.topLeft,
      //     //   end: Alignment.bottomRight,
      //     //   colors: [Color(0XFF3D7695), Color(0XFFDB7343)],
      //     // ),
      //     ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.workout.name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Spacer(),
              Text(
                getCurrentCount().toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(.2),
                      border: Border.all(
                        color: Colors.white.withOpacity(.8),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '+1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(.2),
                      border: Border.all(
                        color: Colors.white.withOpacity(.8),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '+5',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(.2),
                      border: Border.all(
                        color: Colors.white.withOpacity(.8),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '+10',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(.2),
                      border: Border.all(
                        color: Colors.white.withOpacity(.8),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '+25',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(.2),
                      border: Border.all(
                        color: Colors.white.withOpacity(.8),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '+50',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
