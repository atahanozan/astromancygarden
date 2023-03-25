import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteShares {
  String id;
  String image;
  String name;
  String detail;
  String datetime;

  FavoriteShares({
    required this.id,
    required this.image,
    required this.name,
    required this.detail,
    required this.datetime,
  });

  factory FavoriteShares.fromSnapShot(DocumentSnapshot snapshot) {
    return FavoriteShares(
      id: snapshot.id,
      image: snapshot['image'],
      name: snapshot['name'],
      detail: snapshot['detail'],
      datetime: snapshot['datetime'],
    );
  }
}
