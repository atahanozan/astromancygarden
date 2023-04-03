import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fortunetell/model/sharestatus.dart';

class ShareStatusService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //Veri ekleme fonksiyonu
  Future<ShareStatus> addStatus(
    String color,
    String animal,
    String plant,
    String rock,
    String imageanimal,
    String imageplant,
    String imagerock,
    String datetime,
    String explain,
    String uid,
    String name,
    String image,
    String email,
  ) async {
    var ref = _firestore.collection("ShareStatus");

    var documentRef = await ref.add({
      'color': color,
      'animal': animal,
      'plant': plant,
      'rock': rock,
      'imageanimal': imageanimal,
      'imageplant': imageplant,
      'imagerock': imagerock,
      'datetime': datetime,
      'explain': explain,
      'uid': uid,
      'name': name,
      'image': image,
      'email': email,
    });
    return ShareStatus(
      id: documentRef.id,
      color: color,
      animal: animal,
      plant: plant,
      rock: rock,
      imageanimal: imageanimal,
      imageplant: imageplant,
      imagerock: imagerock,
      datetime: datetime,
      explain: explain,
      uid: uid,
      name: name,
      image: image,
      email: email,
    );
  }

  //veri gösterme fonskiyonu
  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore
        .collection("ShareStatus")
        .orderBy('id', descending: true)
        .snapshots();

    return ref;
  }

  //silme fonsiyonu
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("ShareStatus").doc(docId).delete();

    return ref;
  }
}
