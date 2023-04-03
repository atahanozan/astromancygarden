import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fortunetell/model/status.dart';

class StatusService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Veri ekleme fonksiyonu
  Future<Status> addStatus(
    String status,
    String gender,
    String day,
    String month,
    String year,
    String hour,
    String minute,
    String uid,
    String sign,
  ) async {
    var ref = _firestore.collection("Status");

    var documentRef = await ref.add({
      'status': status,
      'gender': gender,
      'day': day,
      'month': month,
      'year': year,
      'hour': hour,
      'minute': minute,
      'uid': uid,
      'sign': sign,
    });
    return Status(
      id: documentRef.id,
      status: status,
      gender: gender,
      day: day,
      month: month,
      year: year,
      hour: hour,
      minute: minute,
      uid: uid,
      sign: sign,
    );
  }

  //veri gösterme fonskiyonu
  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore.collection("Status").snapshots();

    return ref;
  }

  //silme fonsiyonu
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("Status").doc(docId).delete();

    return ref;
  }
}
