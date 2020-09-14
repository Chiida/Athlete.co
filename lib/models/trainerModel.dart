import 'package:cloud_firestore/cloud_firestore.dart';

class Trainer {
  final String trainerName,
      trainingPlanName,
      trainingPlanDuration,
      trainerID,
      description,
      performanceCoach,
      trainerImage;

  Trainer({
    this.trainerName,
    this.trainingPlanDuration,
    this.trainingPlanName,
    this.trainerID,
    this.description,
    this.performanceCoach,
    this.trainerImage,
  });

  factory Trainer.fromDocument(DocumentSnapshot doc) {
    return Trainer(
        trainerID: doc.data()['trainerID'],
        trainerName: doc.data()['trainer_name'],
        trainingPlanName: doc.data()['training_plan_name'],
        trainingPlanDuration: doc.data()['training_plan_duration'],
        description: doc.data()['description'],
        performanceCoach: doc.data()['performance_coach'],
        trainerImage: doc.data()['trainer_image']);
  }
}
