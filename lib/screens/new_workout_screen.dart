import 'package:auto_size_text/auto_size_text.dart';
import 'package:fifty/global.dart';
import 'package:fifty/models/workout.dart';
import 'package:fifty/providers/workout_provider.dart';
import 'package:fifty/screens/widgets/gradient_icon.dart';
import 'package:fifty/screens/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewWorkoutScreen extends StatelessWidget {
  final List<String> preDefinedWorkouts = [
    'Pushups',
    'Situps',
    'Pullups',
    'Squats',
    'Lunge',
    'Bird Dog',
    'Bicycle Crunch',
    'High Knees',
    'Squat Jumps',
    'Jump Rope',
    'Jumping Jacks',
    'Box Jumps',
    'Walking Lunges',
    'Tricep Dips',
    'Pistol Squats',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              // showGeneralDialog(
              //     context: context,
              //     pageBuilder: (context, animation, nextAnimation) {
              //       return CustomWorkoutDialog();
              //     });
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => CustomWorkoutDialog());
            },
            icon: Icon(
              Icons.add,
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
          'New Workout',
          gradient: Global.colors.gradient,
        ),
      ),
      body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 115,
          ),
          children: (preDefinedWorkouts..sort())
              .map<NewWorkoutCard>((e) => NewWorkoutCard(title: e))
              .toList()),
    );
  }
}

class NewWorkoutCard extends StatelessWidget {
  const NewWorkoutCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          context
              .read<WorkoutProvider>()
              .createWorkout(Workout.fromName(name: title));
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: Global.colors.gradient,
            borderRadius: BorderRadius.all(
              Radius.circular(Global.ui.cornerRadius),
            ),
          ),
          child: Center(
            child: AutoSizeText(
              title,
              maxLines: 1,
              minFontSize: 18,
              style: TextStyle(
                color: Colors.white.withOpacity(.8),
                fontWeight: FontWeight.w400,
                fontSize: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomWorkoutDialog extends StatefulWidget {
  const CustomWorkoutDialog({Key? key}) : super(key: key);

  @override
  State<CustomWorkoutDialog> createState() => _CustomWorkoutDialogState();
}

class _CustomWorkoutDialogState extends State<CustomWorkoutDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Global.ui.cornerRadius),
            color: Global.colors.backgroundColor,
          ),
          width: 250,
          height: 175,
          child: Column(
            children: [
              GradientText(
                'Add Custom Workout',
                gradient: Global.colors.gradient,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              TextField(
                controller: _controller,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        String trim = _controller.text.trim();
                        if (trim.isNotEmpty) {
                          context
                              .read<WorkoutProvider>()
                              .createWorkout(Workout.fromName(name: trim));
                          Navigator.popUntil(context, (route) => route.isFirst);
                        }
                      }
                    },
                    child: Text('Add'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
