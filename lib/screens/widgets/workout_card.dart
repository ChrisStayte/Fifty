import 'package:fifty/global.dart';
import 'package:fifty/models/workout.dart';
import 'package:fifty/providers/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    //DateTime givenDate = DateTime(now.year, now.month, now.day + 2);

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

  void addAmountToWorkout(int amount) {
    DateTime now = DateTime.now();
    //DateTime givenDate = DateTime(now.year, now.month, now.day + 2);

    DateTime key = widget.workout.workouts.keys.firstWhere(
        (element) =>
            element.year == now.year &&
            element.month == now.month &&
            element.day == now.day, orElse: () {
      widget.workout.workouts.addAll({now: 0});
      return now;
    });

    int currentAmount = widget.workout.workouts[key]!;

    if (currentAmount == 50) return;

    if (currentAmount + amount > 50) {
      widget.workout.workouts[key] = 50;
    } else {
      widget.workout.workouts[key] = currentAmount + amount;
    }

    context.read<WorkoutProvider>().updateWorkout(widget.workout);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.pushNamed(context, '/workout', arguments: widget.workout.id);
      // },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Delete ${widget.workout.name}?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<WorkoutProvider>()
                          .deleteWorkout(widget.workout);
                      Navigator.pop(context);
                    },
                    child: Text('Yes'),
                  )
                ],
              );
            });
      },
      child: Container(
        height: 100,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(Global.ui.cornerRadius),
          ),
          gradient: Global.colors.gradient,
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
                  WorkoutCardButton(
                    amount: 1,
                    callback: addAmountToWorkout,
                  ),
                  WorkoutCardButton(
                    amount: 5,
                    callback: addAmountToWorkout,
                  ),
                  WorkoutCardButton(
                    amount: 10,
                    callback: addAmountToWorkout,
                  ),
                  WorkoutCardButton(
                    amount: 25,
                    callback: addAmountToWorkout,
                  ),
                  WorkoutCardButton(
                    amount: 50,
                    callback: addAmountToWorkout,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

typedef WorkoutCardButtonCallback(int amount);

class WorkoutCardButton extends StatelessWidget {
  const WorkoutCardButton(
      {super.key, required this.amount, required this.callback});

  final int amount;
  final WorkoutCardButtonCallback callback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          callback(amount);
          HapticFeedback.mediumImpact();
        },
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
              '+$amount',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
