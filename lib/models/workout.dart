import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'workout.g.dart';

@HiveType(typeId: 0)
class Workout extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  Map<DateTime, int> workouts;

  Workout({required this.id, required this.name, required this.workouts});
}
