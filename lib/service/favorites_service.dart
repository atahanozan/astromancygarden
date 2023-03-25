import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fortunetell/model/favorites.dart';

class FavoriteSharesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FavoriteShares> addFavorite(
    String image,
    String name,
    String detail,
    String datetime,
  ) async {
    var ref = _firestore.collection('Favorites');

    var documentRef = await ref.add({
      'image': image,
      'name': name,
      'detail': detail,
      'datetime': datetime,
    });
    return FavoriteShares(
      id: documentRef.id,
      image: image,
      name: name,
      detail: detail,
      datetime: datetime,
    );
  }

  Stream<QuerySnapshot> getFavorites() {
    var ref = _firestore
        .collection('Favorites')
        .orderBy('datetime', descending: true)
        .snapshots();
    return ref;
  }

  Future<void> deleteFavorites(String docId) {
    var ref = _firestore.collection('Favorites').doc(docId).delete();

    return ref;
  }
}
