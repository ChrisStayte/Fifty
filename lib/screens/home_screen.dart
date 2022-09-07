import 'dart:ui';

import 'package:fifty/global.dart';
import 'package:fifty/providers/workout_provider.dart';
import 'package:fifty/screens/help_screen.dart';
import 'package:fifty/screens/widgets/gradient_icon.dart';
import 'package:fifty/screens/widgets/gradient_text.dart';
import 'package:fifty/screens/widgets/workout_card.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: [Color(0XFF7EB0C9), Color(0XFFDB7343)],
        // ),
        color: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onDoubleTap: () {
              if (kDebugMode) {
                context.read<WorkoutProvider>().generateDummyData();
              }
            },
            child: GradientText(
              DateFormat('MMMM dd, yyyy').format(now),
              gradient: Global.colors.gradient,
              // style: TextStyle(
              //   fontSize: 30,
              //   fontWeight: FontWeight.bold,
              // ),
            ),
          ),
          centerTitle: false,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/help'),
              icon: Icon(
                Icons.help,
                color: Color(0XFF3D7695),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            /// This is the start of the horizontal date scroller
            // SizedBox(
            //   height: 50,
            //   child: ShaderMask(
            //     shaderCallback: (Rect rect) {
            //       return LinearGradient(
            //         begin: Alignment.centerLeft,
            //         end: Alignment.centerRight,
            //         colors: [
            //           Colors.red,
            //           Colors.transparent,
            //           Colors.transparent,
            //           Colors.red
            //         ],
            //         stops: [
            //           0.0,
            //           0.1,
            //           0.9,
            //           1.0
            //         ], // 10% purple, 80% transparent, 10% purple
            //       ).createShader(rect);
            //     },
            //     blendMode: BlendMode.dstOut,
            //     child: ListView.separated(
            //       scrollDirection: Axis.horizontal,
            //       physics: ClampingScrollPhysics(),
            //       itemCount: 30,
            //       itemBuilder: (_, __) => Container(
            //         height: 35,
            //         width: 35,
            //         decoration: ShapeDecoration(
            //           shape: ContinuousRectangleBorder(
            //             borderRadius: BorderRadius.circular(28),
            //           ),
            //           color: Colors.blue,
            //         ),
            //         child: Text(''),
            //       ),
            //       separatorBuilder: (BuildContext context, int index) =>
            //           SizedBox(
            //         width: 10,
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 50,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Global.ui.cornerRadius),
                  gradient: Global.colors.gradient,
                ),
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Global.ui.cornerRadius),
                      color: Global.colors.backgroundColor,
                    ),
                    child: Material(
                      borderRadius:
                          BorderRadius.circular(Global.ui.cornerRadius),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/newWorkout');
                        },
                        child: Center(
                          child: GradientIcon(
                            Icons.add,
                            25,
                            Global.colors.gradient,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (BuildContext context, int index) {
                  return WorkoutCard(
                      workout: context.read<WorkoutProvider>().workouts[index]);
                },
                itemCount: context.watch<WorkoutProvider>().workouts.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
