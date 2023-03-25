import 'package:cloud_firestore/cloud_firestore.dart';

class ShareStatus {
  String id;
  String color;
  String animal;
  String plant;
  String rock;
  String imageanimal;
  String imageplant;
  String imagerock;
  String datetime;
  String explain;
  String uid;
  String name;
  String image;
  String email;

  ShareStatus({
    required this.id,
    required this.color,
    required this.animal,
    required this.plant,
    required this.rock,
    required this.imageanimal,
    required this.imageplant,
    required this.imagerock,
    required this.datetime,
    required this.explain,
    required this.uid,
    required this.name,
    required this.image,
    required this.email,
  });

  factory ShareStatus.fromSnapShot(DocumentSnapshot snapshot) {
    return ShareStatus(
      id: snapshot.id,
      color: snapshot['color'],
      animal: snapshot['animal'],
      plant: snapshot['plant'],
      rock: snapshot['rock'],
      imageanimal: snapshot['imageanimal'],
      imageplant: snapshot['imageplant'],
      imagerock: snapshot['imagerock'],
      datetime: snapshot['datetime'],
      explain: snapshot['explain'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      image: snapshot['image'],
      email: snapshot['email'],
    );
  }
}
