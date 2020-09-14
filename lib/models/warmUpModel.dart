import 'package:cloud_firestore/cloud_firestore.dart';

class Warmup {
  final String warmupName, warmupDescription, warmupImage, warmupID;

  Warmup(
      {this.warmupDescription,
      this.warmupID,
      this.warmupImage,
      this.warmupName});

  factory Warmup.fromDocument(DocumentSnapshot doc) {
    return Warmup(
        warmupName: doc.data()['name'],
        warmupDescription: doc.data()['warmup_desc'],
        warmupID: doc.data()['warmupID'],
        warmupImage: doc.data()['warmup_image']);
  }
}
