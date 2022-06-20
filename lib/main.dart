import 'package:fifty/global.dart';
import 'package:fifty/models/workout.dart';
import 'package:fifty/providers/workout_provider.dart';
import 'package:fifty/screens/home_screen.dart';
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
            )),
      ),
      home: HomeScreen(),
    );
  }
}
