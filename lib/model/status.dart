import 'package:cloud_firestore/cloud_firestore.dart';

class Status {
  String id;
  String status;
  String gender;
  String day;
  String month;
  String year;
  String hour;
  String minute;
  String uid;
  String sign;

  Status({
    required this.id,
    required this.status,
    required this.gender,
    required this.day,
    required this.month,
    required this.year,
    required this.hour,
    required this.minute,
    required this.uid,
    required this.sign,
  });

  factory Status.fromSnapshot(DocumentSnapshot snapshot) {
    return Status(
      id: snapshot.id,
      status: snapshot["status"],
      gender: snapshot["gender"],
      day: snapshot["day"],
      month: snapshot["month"],
      year: snapshot["year"],
      hour: snapshot["hour"],
      minute: snapshot["minute"],
      uid: snapshot["uid"],
      sign: snapshot["sign"],
    );
  }
}
