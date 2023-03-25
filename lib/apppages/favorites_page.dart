import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/service/favorites_service.dart';

class FavoritesPageView extends StatefulWidget {
  const FavoritesPageView({Key? key}) : super(key: key);

  @override
  State<FavoritesPageView> createState() => _FavoritesPageViewState();
}

String imageURL =
    "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/profilepic.png?alt=media&token=999968ad-aa14-4459-b2e9-9cadbb2bfae5";

class _FavoritesPageViewState extends State<FavoritesPageView> {
  final FavoriteSharesService _favoriteSharesService = FavoriteSharesService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _favoriteSharesService.getFavorites(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot myFavorites = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 5,
                        bottom: 5,
                      ),
                      child: Card(
                        child: ListTile(
                          tileColor: Colors.pink.shade50,
                          title: Text(myFavorites['name']),
                          subtitle: Text(myFavorites['detail']),
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  myFavorites['image'] ?? imageURL)),
                          trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text("Sil ?"),
                                        content: Text(
                                            "${myFavorites['name']} kişisinin paylaşımını favorilerden kaldırmak istediğinize emin misiniz?"),
                                        actions: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.purple,
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("Hayır")),
                                                TextButton(
                                                    onPressed: () {
                                                      _favoriteSharesService
                                                          .deleteFavorites(
                                                              myFavorites.id);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Evet",
                                                      style: TextStyle(
                                                        color: Colors
                                                            .purple.shade800,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ));
                            },
                            icon: Icon(
                              Icons.delete_rounded,
                              color: Colors.red.shade700,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
