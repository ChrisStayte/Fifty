import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'workout.g.dart';

@HiveType(typeId: 0)
class Workout extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  late Map<DateTime, int> workouts;

  Workout({required this.id, required this.name, required this.workouts});

  Workout.fromName({required this.name}) {
    id = Uuid().v4().toString();
    workouts = <DateTime, int>{DateTime.now(): 0};
  }
}
