import 'package:fifty/global.dart';
import 'package:fifty/providers/workout_provider.dart';
import 'package:fifty/screens/widgets/gradient_icon.dart';
import 'package:fifty/screens/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key, required this.workoutId});

  final String workoutId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Prompt To Delete
            },
            icon: Icon(
              Icons.delete,
              color: Color(0XFF3D7695),
            ),
          )
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: GradientIcon(
            Icons.arrow_back_ios_new,
            20,
            Global.colors.gradient,
          ),
        ),
        title: GradientText(
          context.read<WorkoutProvider>().readWorkout(workoutId)?.name ??
              'NULL',
          gradient: Global.colors.gradient,
        ),
      ),
    );
  }
}
