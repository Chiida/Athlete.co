import 'package:cloud_firestore/cloud_firestore.dart';

class Workout {
  final String workoutName, workoutTag, warmup, workoutID;
  final int numberOfSeries;

  Workout(
      {this.warmup,
      this.workoutName,
      this.workoutTag,
      this.workoutID,
      this.numberOfSeries});

  factory Workout.fromDocument(DocumentSnapshot doc) {
    return Workout(
      workoutID: doc.data()['workoutID'],
      warmup: doc.data()['warmup'],
      workoutName: doc.data()['name'],
      workoutTag: doc.data()['tag'],
      numberOfSeries: doc.data()['num_of_series'],
    );
  }
}
