import 'package:cloud_firestore/cloud_firestore.dart';

class Exercise {
  final String name, image, video, exerciseID, time, repsDescription;
  final int isReps, sets, rest;
  final reps;
  final List<dynamic> tips;

  Exercise(
      {this.exerciseID,
      this.name,
      this.image,
      this.isReps,
      this.reps,
      this.rest,
      this.sets,
      this.tips,
      this.video,
      this.time,
      this.repsDescription});

  factory Exercise.fromDocument(DocumentSnapshot doc) {
    return Exercise(
        exerciseID: doc.data()['exerciseID'],
        name: doc.data()['name'],
        image: doc.data()['image'],
        isReps: doc.data()['isReps'],
        reps: doc.data()['reps'],
        rest: doc.data()['rest'],
        sets: doc.data()['sets'],
        tips: doc.data()['tips'],
        time: doc.data()['time'],
        repsDescription: doc.data()['repsDescription'],
        video: doc.data()['video']);
  }
}
