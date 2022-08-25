import 'dart:collection';

import 'package:fifty/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class WorkoutProvider extends ChangeNotifier {
  static const String BoxName = 'workouts';
  final Box box = Hive.box<Workout>(BoxName);

  List<Workout> _workouts = [];
  UnmodifiableListView<Workout> get workouts => UnmodifiableListView<Workout>(
      _workouts..sort((a, b) => a.name.compareTo(b.name)));

  WorkoutProvider() {
    getWorkouts();
  }

  getWorkouts() {
    _workouts = box.values.toList() as List<Workout>;
    notifyListeners();
  }

  createWorkout(Workout workout) {
    box.add(workout);
    _workouts.add(workout);
    notifyListeners();
  }

  Workout? readWorkout(String id) {
    return _workouts.firstWhere((element) => element.id == id, orElse: null);
  }

  updateWorkout(Workout workout) async {
    workout.save();
    notifyListeners();
  }

  deleteWorkout(Workout workout) async {
    workout.delete();
    _workouts.remove(workout);
    notifyListeners();
  }

  generateDummyData() {
    Workout workout = Workout(
      id: Uuid().v4().toString(),
      name: 'Pushups',
      workouts: <DateTime, int>{},
    );

    box.add(workout);
    _workouts.add(workout);
    notifyListeners();
  }
}
