import 'package:fifty/global.dart';
import 'package:fifty/models/workout.dart';
import 'package:fifty/providers/workout_provider.dart';
import 'package:fifty/screens/help_screen.dart';
import 'package:fifty/screens/home_screen.dart';
import 'package:fifty/screens/new_workout_screen.dart';
import 'package:fifty/screens/timer_screen.dart';
import 'package:fifty/screens/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  Hive.registerAdapter<Workout>(WorkoutAdapter());

  await Hive.initFlutter();
  await Hive.openBox<Workout>(WorkoutProvider.BoxName);
  runApp(
    ChangeNotifierProvider<WorkoutProvider>(
        create: (_) => WorkoutProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fifty',
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Global.colors.backgroundColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Global.colors.backgroundColor,
          titleTextStyle: TextStyle(
            fontSize: 26,
            color: Colors.black,
          ),
        ),
      ),
      home: HomeScreen(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => HomeScreen());
          case '/help':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  HelpScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0, -1);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end);
                final offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
              // transitionDuration: const Duration(seconds: 1),
              //return MaterialPageRoute(builder: (_) => HelpScreen());
            );
          case '/timer':
            return MaterialPageRoute(builder: (_) => TimerScreen());
          case '/newWorkout':
            return MaterialPageRoute(builder: (_) => NewWorkoutScreen());
          case '/workout':
            String workoutId = settings.arguments as String;
            return MaterialPageRoute(
                builder: (_) => WorkoutScreen(workoutId: workoutId));
          default:
            throw ('error');
        }
      },
    );
  }
}
